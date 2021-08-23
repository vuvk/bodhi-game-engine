// modules: sndfile gee-0.8 openal physfs
// sources: src/resources/file.vala
// sources: src/
// sources: src/system/subsystem/audio_system/audio_source.vala
// vapidirs: vapi

using Sndfile;
using Gee;

namespace Bodhi {

    public class AudioFile : Object {

        private static count_t get_filelen_callback(void* userdata) {
            Bodhi.File file = (Bodhi.File)userdata;
            return (count_t)file.get_size();
        }

        private static count_t seek_callback(count_t offset, int whence, void* userdata) {
            Bodhi.File file = (Bodhi.File)userdata;
            switch (whence) {
                case Sndfile.SEEK_SET:
                    break;

                case Sndfile.SEEK_END:
                    offset = (count_t)file.get_size() - offset;
                    break;

                case Sndfile.SEEK_CUR:
                    offset = (count_t)file.tell() + offset;
                    break;
            }

            /* return -1 if error */
            if (file.seek(offset) == 0)
                return -1;

            /* return new pos */
            return offset;
        }

        private static count_t read_callback(void* ptr, count_t count, void* userdata) {
            Bodhi.File file = (Bodhi.File)userdata;
            return (count_t)file.read((uint8[])ptr, count);
        }

        private static count_t write_callback(void* ptr, count_t count, void* userdata) {
            Bodhi.File file = (Bodhi.File)userdata;
            return (count_t)file.write_bytes((uint8[])ptr, count);
        }

        private static count_t tell_callback(void* userdata) {
            Bodhi.File file = (Bodhi.File)userdata;
            return (count_t)file.tell();
        }

        internal VirtualIO get_io() {
            return {
                get_filelen_callback,
                seek_callback,
                read_callback,
                write_callback,
                tell_callback
            };
        }

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

        internal AudioFile(Bodhi.File file, bool precached = false) {
            LIB.add(this);
            load(file, precached);
        }

        ~AudioFile() {
            unload();

            if (AudioSource.LIB != null) {
                foreach (AudioSource source in AudioSource.LIB) {
                    if (source.get_audio_file() == this) {
                        source.unset_audio_file();
                    }
                }
            }

            LIB.remove(this);
        }

        public void load(Bodhi.File file, bool precached = false) {
            unload();

            /* Open the audio file and check that it's usable. */
            sndfile = new Sndfile.File.virtual(get_io(),
                                               Sndfile.Mode.READ,
                                               ref sfinfo,
                                               file);
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

            this.filename = file.get_filename();
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

        internal AL.Buffer get_al_buffer() {
            return buffer;
        }

        public string get_filename() {
            return filename;
        }

        internal AL.BufferFormat get_al_format() {
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
