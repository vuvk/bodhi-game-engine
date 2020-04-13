namespace Bodhi {
    public class FileSystem : Object {

        public enum States {
            NOT_INITIALIZED,
            INITIALIZED
        }

        private string base_dir = ".";
        private States state = States.NOT_INITIALIZED;

        internal FileSystem(string? argv0 = "./") {
            if (PHYSFS.init(argv0)) {
                state = States.INITIALIZED;

                base_dir = PHYSFS.get_base_dir();

                Log.write_message("Initialized PhysFS, supported archive formats:\n");
                unowned PHYSFS.ArchiveInfo*[] infos = PHYSFS.supported_archive_types();
                foreach (PHYSFS.ArchiveInfo* info in infos) {
                    if (info == null) {
                        break;
                    }
                    Log.write_message("\n  " + info.extension + ": " + info.description + "\n");
                }
            } else {
                Log.write_error("Failed to initialize PhysFS.\n");
                print_last_error();
            }
        }

        ~FileSystem() {
            PHYSFS.deinit();
        }

        // A PhysFS-specific function to mount a new path to the virtual directory
        // tree.
        public bool mount(string path, string mount_point = "", bool append = false) {
            if (!is_initialized()) {
                return false;
            }
        
            if (!PHYSFS.mount(path, mount_point, append)) {
                Log.write_error("Failed to add \"" + path + "\"\n");
                print_last_error();
                return false;
            }

            return true;
        }

        public void list_directory(string dir) {
            if (!is_initialized()) {
                return;
            }

            unowned string?[] files = PHYSFS.enumerate_files(dir);
            PHYSFS.Stat stat;
            foreach (string file_path in files) {
                string file = dir + file_path;

                if (!PHYSFS.stat(file, out stat)) {
                    print_last_error();
                    continue;
                }

                if (stat.filetype == PHYSFS.FileType.DIRECTORY) {
                    list_directory(file + "/");
                } else {
                    print("  " + file + "\n");
                }
            }
            PHYSFS.free_list(files);
        }

        public unowned string get_base_dir() {
            return base_dir;
        }

        public bool is_initialized() {
            return state == States.INITIALIZED;
        }

        public States get_state() {
            return state;
        }

        public bool error_exists() {
            return (PHYSFS.get_last_error_code() != PHYSFS.ErrorCode.OK);            
        }

        public void print_last_error() {
            if (error_exists()) {
                PHYSFS.ErrorCode error_code = PHYSFS.get_last_error_code();
                Log.write_error(PHYSFS.get_error_by_code(error_code) + "\n");
            }
        }

    }
}