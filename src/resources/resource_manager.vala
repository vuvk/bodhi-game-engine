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
            if (!SDLImage.init(flags)) {
                return Errors.IMAGE_LOADER_NOT_CREATED;
            }

            return Errors.NO_ERROR;
        }


        public AudioFile? open_audio_file(string filename, bool precached = false) {
            if (is_initialized()) {
                return new AudioFile(filename, precached);
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
                return new File(path, mode);
            }
            return null;
        }
    }

}
