namespace Bodhi {
    public class Audio : SubSystem {

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
                if (Alure.init_device()) {
                    Engine.get_log().write("Audio device initialized!\n");
                    return Errors.NO_ERROR;
                } else {
                    Engine.get_log().write_error(@"Failed to initialize Audio device: $(get_last_error())\n");
                    return Errors.AUDIO_NOT_CREATED;
                }
            }
        }

        internal override void deinit() {
            if (is_initialized()) {
                if (!Alure.shutdown_device()) {
                    Engine.get_log().write_error(@"WOW! Failed to shutdown Audio device: $(get_last_error())\n");
                } else {
                    Engine.get_log().write_warning("Audio device shutdowned!\n");
                    state = States.NOT_INITIALIZED;
                }

                listener = null;
            }
        }

        public bool error_exists() {
            if (is_initialized()) {
                string? error = Alure.get_error_string();

                return (error != null && error.length > 0 && error != "No error");
            }

            return false;
        }

        public string get_last_error() {
            if (error_exists()) {
                return Alure.get_error_string();
            }
            return "";
        }

        public void print_last_error() {
            if (error_exists()) {
                Engine.get_log().write(get_last_error() + "\n");
            }
        }

        public AudioListener? get_listener() {
            if (is_initialized() && listener == null) {
                listener = new AudioListener();
            }
            return listener;
        }
    }
}
