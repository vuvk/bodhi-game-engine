namespace Bodhi {
    public class Audio : SubSystem {

        private ALC.Device device;
        private ALC.Context ctx;
        private AudioListener? listener;

        internal Audio() {
            base();
            subsystem_name = "Audio System";
        }

        ~Audio() {
            deinit();
        }

        protected override Errors init() {
            if (!Engine.is_running()) {
                stderr.printf("I can't create audio system if engine is not started!\n");
                return Errors.ENGINE_NOT_STARTED;
            } else {
                /* Open and initialize a device */
                device = new ALC.Device(null);
                if (device == null) {
                    Engine.get_log().write_error("Could not open a device!\n");
                    return Errors.AUDIO_NOT_CREATED;
                }

                ctx = new ALC.Context(device, null);
                if (ctx == null || !ctx.make_current()) {
                    Engine.get_log().write_error("Could not set a context!\n");
                    return Errors.AUDIO_NOT_CREATED;
                }

                string? name = null;
                if (device.is_extension_present("ALC_ENUMERATE_ALL_EXT")) {
                    name = device.get_string(ALC.ALL_DEVICES_SPECIFIER);
                }

                if (name == null || device.get_error() != ALC.Error.NO_ERROR) {
                    name = device.get_string(ALC.DEVICE_SPECIFIER);
                }

                Engine.get_log().write(@"Opened \"$name\"\n");

                return Errors.NO_ERROR;
            }
        }

        internal override void deinit() {
            if (is_initialized()) {
                if (ctx == null) {
                    return;
                }

                ctx = null;
                device = null;

                Engine.get_log().write_warning("Audio device shutdowned!\n");
                state = State.NOT_INITIALIZED;

                listener = null;
            }
        }

        internal void update() {
            if (AudioSource.LIB != null) {
                foreach (AudioSource source in AudioSource.LIB) {
                    source.update();
                }
            }
        }

        public bool error_exists() {
            if (is_initialized()) {
                string error = get_last_error();
                return (error.length > 0 && error != "No error");
            }

            return false;
        }

        public string get_last_error() {
            string error = "No error";

            if (is_initialized()) {
                AL.Error  al_error = AL.get_error();
                ALC.Error alc_error = device.get_error();

                string al_error_string = "";
                if (al_error != AL.Error.NO_ERROR) {
                    al_error_string = AL.get_string(al_error);
                }

                string alc_error_string = "";
                if (alc_error != ALC.Error.NO_ERROR) {
                    alc_error_string = device.get_string(alc_error);
                }

                if (al_error_string.length > 0 || alc_error_string.length > 0) {
                    error = al_error_string + " " + alc_error_string;
                }
            }

            return error;
        }

        public void print_last_error() {
            Engine.get_log().write(get_last_error() + "\n");
        }

        public AudioListener? get_listener() {
            if (is_initialized() && listener == null) {
                listener = new AudioListener();
            }
            return listener;
        }

        public AudioSource? new_audio_source() {
            if (is_initialized()) {
                return new AudioSource();
            }
            return null;
        }
    }
}
