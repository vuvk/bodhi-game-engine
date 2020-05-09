using Gee;

namespace Bodhi {

    public class AudioSource {

        public enum State {
            INITIAL,
            PLAYING,
            PAUSED,
            STOPPED
        }

        internal static ArrayList<AudioSource> LIB = new ArrayList<AudioSource>();

        private AL.Source source;
        private AL.ALfloat offset;
        private AudioFile? audio_file;
        private State state = State.STOPPED;

        internal AudioSource() {
            AL.gen_source(1, out source);
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
                    if (Engine.get_audio().error_exists()) {
                        Engine.get_log().write_error("Failed to setup sound source\n");
                        return;
                    }
                }
            }
        }

        public void unset_audio_file() {
            stop();

            audio_file = null;
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

        public bool is_stopped() {
            return state == State.STOPPED;
        }

        public void play() {
            if (AL.is_source(source)) {
                source.play();
            }
        }

        public void stop() {
            if (AL.is_source(source)) {
                source.stop();
            }
            state = State.STOPPED;
        }

        internal void update() {
            if (AL.is_source(source)) {
                AL.ALint param;
                source.get_parami(AL.SOURCE_STATE, out param);
                switch ((AL.SourceState)param) {
                    case AL.SourceState.INITIAL : state = State.INITIAL; break;
                    case AL.SourceState.PLAYING : state = State.PLAYING; break;
                    case AL.SourceState.PAUSED  : state = State.PAUSED;  break;
                    case AL.SourceState.STOPPED : state = State.STOPPED; break;
                }

                /* Get the source offset. */
                source.get_paramf(AL.SourceBufferPosition.SEC_OFFSET, out offset);
            }
        }
    }
}
