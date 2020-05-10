using Gee;

namespace Bodhi {

    public class AudioFile : Object {

        internal static ArrayList<AudioFile> LIB = new ArrayList<AudioFile>();

        private string filename = "";
        private AL.Buffer buffer;

        /* Handle for the audio file */
        private Sndfile.File sndfile;
        private Sndfile.Info sfinfo;
        private int audio_data_size = -1;

        /* The format of the output stream (sample rate is in sfinfo) */
        private AL.BufferFormat format;
        private bool precached = false;
        private bool loaded = false;

        internal AudioFile(string filename, bool precached = false) {
            LIB.add(this);
            load(filename, precached);
        }

        ~AudioFile() {
            unload();

            foreach (AudioSource source in AudioSource.LIB) {
                if (source.get_audio_file() == this) {
                    source.unset_audio_file();
                }
            }

            LIB.remove(this);
        }

        public void load(string filename, bool precached = false) {
            unload();
/*
            Bodhi.File? file = Bodhi.FileSystem.new_file(filename);
            if (file == null) {
                Engine.get_log().write_error(@"Couldn't load file:\"$filename\"");
                return;
            }
*/
            /* Open the audio file and check that it's usable. */
            sndfile = new Sndfile.File(filename, Sndfile.Mode.READ, ref sfinfo);
            if (sndfile == null) {
                Engine.get_log().write_error(@"Could not open audio in $filename: $(Sndfile.File.strerror(sndfile))\n");
                return;
            }

            if (sfinfo.frames < 1 || sfinfo.frames > (int)(int.MAX/sizeof(short))/sfinfo.channels) {
                Engine.get_log().write_error(@"Bad sample count in $filename ($(sfinfo.frames))\n");
                return;
            }

            /* Get the sound format, and figure out the OpenAL format */
            switch (sfinfo.channels) {
                case 1 : format = AL.BufferFormat.MONO16; break;
                case 2 : format = AL.BufferFormat.STEREO16; break;
                default :
                    Engine.get_log().write_error(@"Unsupported channel count: $(sfinfo.channels)\n");
                    return;
            }

            audio_data_size = (int)((sfinfo.frames * sfinfo.channels) * sizeof(short));

            if (precached) {
                /* Decode the whole audio file to a buffer. */
                short[] membuf = new short[sfinfo.frames * sfinfo.channels];

                int num_frames = sndfile.readf_short(membuf, sfinfo.frames);
                if (num_frames < 1) {
                    Engine.get_log().write_error("Failed to read samples in $filename: ($num_frames)\n");
                    return;
                }

                /* Buffer the audio data into a new buffer object, then free the data and
                * close the file.
                */
                AL.gen_buffer(1, out buffer);
                buffer.set_data(format, (uint8[])membuf, audio_data_size, sfinfo.samplerate);

                /* Check if an error occured, and clean up if so. */
                var audio = Engine.get_audio();
                if (audio.error_exists()) {
                    audio.print_last_error();
                    if (buffer != 0 && AL.is_buffer(buffer)) {
                        AL.delete_buffer(1, ref buffer);
                    }
                    return;
                }
            }

            this.filename = filename;
            this.precached = precached;
            this.loaded = true;
        }

        public void unload() {
            if (is_precached()) {
                if (AL.is_buffer(buffer)) {
                    AL.delete_buffer(1, ref buffer);
                }
            }

            filename = "";
            buffer = -1;
            sndfile = null;
            audio_data_size = -1;

            precached = false;
            loaded = false;
        }

        public bool is_loaded() {
            return loaded;
        }

        public bool is_precached() {
            return precached;
        }

        internal AL.Buffer get_buffer() {
            return buffer;
        }

        public string get_filename() {
            return filename;
        }

        internal AL.BufferFormat get_format() {
            return format;
        }

        public int get_audio_data_size() {
            if (is_loaded()) {
                return audio_data_size;
            }
            return -1;
        }
    }
}