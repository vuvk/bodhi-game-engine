using Gee;

namespace Bodhi {

    public class AudioSource {

        public enum State {
            INITIAL,
            PLAYING,
            PAUSED,
            STOPPED
        }

        class AudioStream {
            private const int NUM_BUFFERS = 4;
            private const int BUFFER_SAMPLES = 8192;

            /* These are the buffers to play out through OpenAL with */
            private AL.Buffer[] buffers = new AL.Buffer[NUM_BUFFERS];

            /* Handle for the audio file */
            private Sndfile.File sndfile;
            private Sndfile.Info sfinfo;
            private short[] membuf;

            /* The format of the output stream (sample rate is in sfinfo) */
            private AL.BufferFormat format;

            internal AudioStream(AudioFile audio_file) {
                if (!audio_file.is_loaded()) {
                    return;
                }

                /* Generate the buffers */
                AL.gen_buffers(buffers.length, buffers);

                var audio = Engine.get_audio();
                if (audio.error_exists()) {
                    Engine.get_log().write_error(@"Could not create buffers in audio stream: $(audio.get_last_error())\n");
                    return;
                }

                size_t frame_size;

                close_file();

                /* Open the audio file and check that it's usable. */
                string filename = audio_file.get_filename();
                sndfile = new Sndfile.File(filename, Sndfile.Mode.READ, ref sfinfo);
                if (sndfile == null) {
                    Engine.get_log().write_error(@"Could not open audio in $filename: $(Sndfile.File.strerror(null))\n");
                    return;
                }

                format = audio_file.get_format();

                membuf = new short[BUFFER_SAMPLES * sfinfo.channels];
            }

            ~AudioStream() {
                close_file();

                AL.delete_buffers(buffers.length, buffers);
                var audio = Engine.get_audio();
                if (audio.error_exists()) {
                    Engine.get_log().write_error(@"Failed to delete object IDs: $(audio.get_last_error())@\n");
                }
            }

            internal AL.Buffer[] get_buffers() {
                return buffers;
            }

            internal short[] get_membuf() {
                return membuf;
            }

            /* Closes the audio file stream */
            void close_file() {
                sndfile = null;
                membuf = null;
            }

            /* Prebuffers some audio from the file, and starts playing the source */
            internal bool prepare() {
                sndfile.seek(0, 0);

                /* Fill the buffer queue */
                for (int i = 0; i < NUM_BUFFERS; ++i) {
                    /* Get some data to give it to the buffer */
                    int slen = sndfile.readf_short(membuf, BUFFER_SAMPLES);
                    if (slen < 1) {
                        break;
                    }

                    slen *= (int) (sfinfo.channels * sizeof(short));
                    buffers[i].set_data(format, (uint8[])membuf, (AL.ALsizei)slen, sfinfo.samplerate);
                }

                var audio = Engine.get_audio();
                if (audio.error_exists()) {
                    Engine.get_log().write_error(@"Error buffering for playback: $(audio.get_last_error())@\n");
                    return false;
                }

                return true;
            }

            internal bool update(AL.Source source) {
                AL.SourceState state;
                AL.ALint processed;
                var audio = Engine.get_audio();

                /* Get relevant source info */
                AL.ALint param;
                source.get_parami(AL.SOURCE_STATE, out param);
                state = (AL.SourceState)param;
                source.get_parami(AL.BUFFERS_PROCESSED, out processed);

                /* Unqueue and handle each processed buffer */
                while (processed > 0) {
                    AL.Buffer bufid = 0;
                    int slen;

                    if (AL.is_buffer(bufid)) {
                        source.unqueue_buffer(1, ref bufid);
                        processed--;
                    }

                    /* Read the next chunk of data, refill the buffer, and queue it
                     * back on the source */
                    slen = sndfile.readf_short(membuf, BUFFER_SAMPLES);
                    if (slen > 0) {
                        slen *= (int) (sfinfo.channels * sizeof(short));
                        bufid.set_data(format, (uint8[])membuf, (AL.ALsizei)slen, sfinfo.samplerate);
                        source.queue_buffer(1, ref bufid);
                    }

                    if (audio.error_exists()) {
                        Engine.get_log().write_error(@"Error buffering data: $(audio.get_last_error())@\n");
                        return false;
                    }
                }

                /* Make sure the source hasn't underrun */
                if (state != AL.SourceState.PLAYING && state != AL.SourceState.PAUSED) {
                    AL.ALint queued;

                    /* If no buffers are queued, playback is finished */
                    source.get_parami(AL.BUFFERS_QUEUED, out queued);
                    if (queued == 0) {
                        return false;
                    }

                    source.play();

                    if (audio.error_exists()) {
                        Engine.get_log().write_error("Error restarting playback\n");
                        return false;
                    }
                }

                return true;
            }
        }

        internal static ArrayList<AudioSource> LIB = new ArrayList<AudioSource>();

        private AL.Source source;
        private AL.ALfloat offset;
        private AL.ALfloat bytes_offset;
        private AudioFile? audio_file;
        private AudioStream? audio_stream;
        private bool streaming = false;
        private State state = State.STOPPED;

        internal AudioSource() {
            AL.gen_source(1, out source);
            LIB.add(this);
        }

        ~AudioSource() {
            LIB.remove(this);
            if (AL.is_source(source)) {
                AL.delete_source(1, ref source);
            }
        }

        public void set_audio_file(AudioFile file) {
            unset_audio_file();

            if (file.is_loaded()) {
                audio_file = file;

                if (file.is_precached()) {
                    source.set_parami(AL.BUFFER, (AL.ALint)audio_file.get_buffer());
                } else {
                    audio_stream = new AudioStream(audio_file);
                    streaming = true;
                }

                if (Engine.get_audio().error_exists()) {
                    Engine.get_log().write_error("Failed to setup sound source\n");
                    return;
                }
            }
        }

        public void unset_audio_file() {
            stop();

            audio_file = null;
            audio_stream = null;

            streaming = false;
        }

        internal AudioFile? get_audio_file() {
            return audio_file;
        }

        public State get_state() {
            return state;
        }

        public bool is_playing() {
            return state == State.PLAYING;
        }

        public bool is_paused() {
            return state == State.PAUSED;
        }

        public bool is_stopped() {
            return state == State.STOPPED;
        }

        public void play() {
            if (AL.is_source(source)) {
                if (!is_paused()) {
                    rewind();
                }
                source.play();
                state = State.PLAYING;
            }
        }

        public void pause() {
            if (AL.is_source(source)) {
                source.pause();
                state = State.PAUSED;
            }
        }

        public void rewind() {
            stop();
            if (AL.is_source(source)) {
                source.rewind();

                if (streaming) {
                    source.set_parami(AL.BUFFER, 0);

                    if (!audio_stream.prepare()) {
                        return;
                    }

                    AL.Buffer[] buffers = audio_stream.get_buffers();
                    source.queue_buffers(buffers.length, buffers);

                    if (Engine.get_audio().error_exists()) {
                        Engine.get_log().write_error("Error starting playback\n");
                    }
                }
            }
        }

        public void stop() {
            if (AL.is_source(source)) {
                source.stop();
                state = State.STOPPED;
            }
        }

        internal void update() {
            if (AL.is_source(source)) {
                // get current state
                AL.ALint param;
                source.get_parami(AL.SOURCE_STATE, out param);
                switch ((AL.SourceState)param) {
                    case AL.SourceState.INITIAL : state = State.INITIAL; break;
                    case AL.SourceState.PLAYING : state = State.PLAYING; break;
                    case AL.SourceState.PAUSED  : state = State.PAUSED;  break;
                    case AL.SourceState.STOPPED :
                    default:
                        state = State.STOPPED; break;
                }

                if (streaming && is_playing()) {
                    audio_stream.update(source);
                }

                /* Get the source offset. */
                source.get_paramf(AL.SourceBufferPosition.SEC_OFFSET,  out offset);
                source.get_paramf(AL.SourceBufferPosition.BYTE_OFFSET, out bytes_offset);
            }
        }
    }
}
