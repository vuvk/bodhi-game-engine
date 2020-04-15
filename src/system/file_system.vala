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
                base_dir = (argv0 != null) ? argv0 : "./";
                state = States.INITIALIZED;
                if (!mount(base_dir)) {
                    Log.write_error("Failed to initialize PhysFS. " + get_last_error() + "\n");
                    state = States.NOT_INITIALIZED;
                    return;
                }

                Log.write_message("Initialized PhysFS, supported archive formats:\n");
                foreach (string format in get_supported_archives()) {
                    Log.write_message(format + "\n");
                }
            } else {
                Log.write_error("Failed to initialize PhysFS. " + get_last_error() + "\n");
            }
        }

        ~FileSystem() {
            PHYSFS.deinit();
        }

        // A PhysFS-specific function to mount a new path to the virtual directory
        // tree.
        public bool mount(string path, string mount_point = "", bool append_to_path = true) {
            if (!is_initialized()) {
                return false;
            }
        
            if (!PHYSFS.mount(path, mount_point, append_to_path)) {
                Log.write_error("Failed to add \"" + path + "\"\n");
                print_last_error();
                return false;
            }

            return true;
        }

        public string[] get_supported_archives() {
            string[] lines = new string[0];

            unowned PHYSFS.ArchiveInfo*[] infos = PHYSFS.supported_archive_types();
            
            for (int i = 0;; ++i) {
                PHYSFS.ArchiveInfo* info = infos[i];
                if (info == null) {
                    break;
                }
                
                lines += info->extension + ": " + 
                         info->description + " [" +
                         info->author + " - " +
                         info->url + "]";
            }

            return lines;
        }

        public string[] get_supported_archives_types() {
            string[] types = new string[0];

            unowned PHYSFS.ArchiveInfo*[] infos = PHYSFS.supported_archive_types();
            
            for (int i = 0;; ++i) {
                PHYSFS.ArchiveInfo* info = infos[i];
                if (info == null) {
                    break;
                }
                
                types += info->extension;
            }

            return types;
        }

        public string[] get_list_directory(string dir) {
            string[] paths = new string[0];

            if (is_initialized()) {
                unowned string?[] files = PHYSFS.enumerate_files(dir);
                for (int i = 0; files[i] != null; ++i) {                
                    string file = dir + files[i];
    
                    if (path_is_folder(file)) {
                        foreach (string path in get_list_directory(file + "/")) {
                            paths += path;
                        }
                    } else {
                        paths += file;
                    }
                }
                PHYSFS.free_list(files);
            }

            return paths;
        }

        public bool path_is_folder(string path) {
            PHYSFS.Stat stat;
            if (!PHYSFS.stat(path, out stat)) {
                print_last_error();
                return false;
            }

            return stat.filetype == PHYSFS.FileType.DIRECTORY;
        }

        public bool path_is_file(string path) {
            PHYSFS.Stat stat;
            if (!PHYSFS.stat(path, out stat)) {
                print_last_error();
                return false;
            }

            return stat.filetype == PHYSFS.FileType.REGULAR;
        }

        public void print_list_directory(string dir) {
            foreach (string path in get_list_directory(dir)) {
                print(path + "\n");
            }
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

        public string get_last_error() {
            if (error_exists()) {
                PHYSFS.ErrorCode error_code = PHYSFS.get_last_error_code();
                return PHYSFS.get_error_by_code(error_code);
            }
            return "";
        }

        public void print_last_error() {
            if (error_exists()) {
                Log.write_error(get_last_error() + "\n");
            }
        }

    }
}
