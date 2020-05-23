namespace Bodhi {

    public class ResourceManager : SubSystem {

        internal ResourceManager() {
            base();
            subsystem_name = "Resource Manager";
        }

        ~ResourceManager() {
            deinit();
        }

        protected override Errors init() {
            if (!FileSystem.is_initialized()) {
                return Errors.ENGINE_NOT_CREATED;
            }

            if (!Engine.is_running()) {
                return Errors.ENGINE_NOT_STARTED;
            }

            if (!Engine.get_audio().is_initialized()) {
                return Errors.ENGINE_NOT_CREATED;
            }

            int flags = SDLImage.InitFlags.JPG | SDLImage.InitFlags.PNG;
            if ((SDLImage.init(flags) & flags) == 0) {
                Engine.get_log().write_error("Could not initialize image loader!");
            }

            return Errors.NO_ERROR;
        }


        public AudioFile? open_audio_file_from_path(string filename, bool precached = false) {
            return open_audio_file(new_file(filename, "r"), precached);
        }

        public AudioFile? open_audio_file(Bodhi.File file, bool precached = false) {
            if (is_initialized()) {
                return new Bodhi.AudioFile(file, precached);
            }
            return null;
        }

        /**
         * get file from system
         * @param path - path to file
         * @param mode - mode access. Possible values - "r" read, "w" write, "a" append
         */
        public File? new_file(string path, string mode = "r") {
            if (is_initialized()) {
                return new Bodhi.File(path, mode);
            }
            return null;
        }

        /**
         * load surface from image file
         * @param path - path to file
         */
        public Surface? new_surface_from_path(string path) {
            return new_surface(new_file(path, "r"));
        }

        /**
         * load surface from image file
         * @param file - Bodhi.File
         */
        public Surface? new_surface(Bodhi.File file) {
            if (is_initialized()) {
                return new Bodhi.Surface(file);
            }
            return null;
        }
    }

}
