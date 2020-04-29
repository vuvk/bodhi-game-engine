namespace Bodhi {
    public class FileSystem : Object {

        public enum States {
            NOT_INITIALIZED,
            INITIALIZED
        }

        private static string base_dir = ".";
        private static States state = States.NOT_INITIALIZED;

        private FileSystem(){}
        ~FileSystem(){}

        internal static bool init(string? argv0 = ".") {
            if (!is_initialized()) {
                if (PHYSFS.init(argv0)) {
                    base_dir = (argv0 != null) ? argv0 : ".";
                    state = States.INITIALIZED;
                    if (!mount(base_dir) || !set_write_dir(base_dir)) {
                        stderr.printf("Failed to initialize PhysFS. " + get_last_error() + "\n");
                        state = States.NOT_INITIALIZED;
                        return false;
                    }

                    stdout.printf("Initialized PhysFS, supported archive formats:\n");
                    foreach (string format in get_supported_archives()) {
                        stdout.printf(format + "\n");
                    }
                } else {
                    stderr.printf("Failed to initialize PhysFS. " + get_last_error() + "\n");
                    return false;
                }
            }

            return true;
        }

        internal static bool deinit() {
            if (is_initialized()) {
                if (PHYSFS.is_init() && !PHYSFS.deinit()) {
                    stderr.printf(get_last_error() + "\n");
                    return false;
                }
                Engine.get_log().write_warning("FileSystem shutdowned!\n");
                state = States.NOT_INITIALIZED;
            }
            return true;
        }

        // A PhysFS-specific function to mount a new path to the virtual directory
        // tree.
        public static bool mount(string path, string mount_point = "", bool append_to_path = true) {
            if (!is_initialized()) {
                return false;
            }

            if (!PHYSFS.mount(path, mount_point, append_to_path)) {
                stderr.printf("Failed to add \"" + path + "\"\n");
                print_last_error();
                return false;
            }

            return true;
        }

        public static string[] get_supported_archives() {
            string[] lines = {};

            if (is_initialized()) {
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
            }

            return lines;
        }

        public static string[] get_supported_archives_types() {
            string[] types = {};

            if (is_initialized()) {
                unowned PHYSFS.ArchiveInfo*[] infos = PHYSFS.supported_archive_types();

                for (int i = 0;; ++i) {
                    PHYSFS.ArchiveInfo* info = infos[i];
                    if (info == null) {
                        break;
                    }

                    types += info->extension;
                }
            }

            return types;
        }

        public static string[] get_list_directory(string dir) {
            string[] paths = {};

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

        public static bool path_exists(string path) {
            if (is_initialized()) {
                return PHYSFS.exists(path);
            }
            return false;
        }

        public static bool path_is_folder(string path) {
            if (is_initialized() && path_exists(path)) {
                PHYSFS.Stat stat;
                if (PHYSFS.stat(path, out stat)) {
                    return stat.filetype == PHYSFS.FileType.DIRECTORY;
                } else {
                    print_last_error();
                }
            }

            return false;
        }

        public static bool path_is_file(string path) {
            if (is_initialized() && path_exists(path)) {
                PHYSFS.Stat stat;
                if (PHYSFS.stat(path, out stat)) {
                    return stat.filetype == PHYSFS.FileType.REGULAR;
                } else {
                    print_last_error();
                }
            }

            return false;
        }

        public static void print_list_directory(string dir) {
            foreach (string path in get_list_directory(dir)) {
                print(path + "\n");
            }
        }

        public static unowned string get_base_dir() {
            return base_dir;
        }

        public static bool is_initialized() {
            return state == States.INITIALIZED;
        }

        public static States get_state() {
            return state;
        }

        public static bool error_exists() {
            if (is_initialized()) {
                return (PHYSFS.get_last_error_code() != PHYSFS.ErrorCode.OK);
            }
            return false;
        }

        public static string get_last_error() {
            if (error_exists()) {
                PHYSFS.ErrorCode error_code = PHYSFS.get_last_error_code();
                return PHYSFS.get_error_by_code(error_code);
            }
            return "";
        }

        public static void print_last_error() {
            if (error_exists()) {
                stderr.printf(get_last_error() + "\n");
            }
        }

        public static bool set_write_dir(string dir) {
            if (is_initialized()) {
                return PHYSFS.set_write_dir(dir);
            }
            return false;
        }

        /**
         * get file from system
         * @param path - path to file
         * @param mode - mode access. Possible values - "r" read, "w" write, "a" append
         */
        public static File? new_file(string path, string mode = "r") {
            if (!is_initialized()) {
                return null;
            }

            return new File(path, mode);
        }


        /*
        * File class
        */
        public class File : Object {
            private PHYSFS.File handle;
            private string name = "";

            internal File(string path, string mode = "r") {
                name = path;

                if (!open(mode)) {
                    stderr.printf("Couldn't create file \"" + path + "\"\n");
                    stderr.printf(get_last_error() + "\n");
                }
            }

            ~File() {
                close();
            }

            public bool is_folder() {
                if (is_initialized()) {
                    PHYSFS.Stat stat;
                    if (PHYSFS.stat(name, out stat)) {
                        return stat.filetype == PHYSFS.FileType.DIRECTORY;
                    }
                }

                return false;
            }

            public bool is_file() {
                if (is_initialized()) {
                    if (handle == null) {
                        return false;
                    }

                    PHYSFS.Stat stat;
                    if (PHYSFS.stat(this.name, out stat)) {
                        return stat.filetype == PHYSFS.FileType.REGULAR;
                    }
                }

                return false;
            }

            public string get_ext(bool to_lower = false) {
                if (!is_file()) {
                    return "";
                }

                long pos = name.last_index_of(".");
                string ext = name.substring(pos, name.length - pos);

                if (to_lower) {
                    ext = ext.down();
                }

                return ext;
            }

            public int64 size() {
                if (is_file()) {
                    return handle.length();
                }

                return -1;
            }

            public int64 read_full(uint8[] buffer) {
                if (is_file()) {
                    buffer.resize((int)size());
                    return read(buffer, buffer.length);
                }

                return -1;
            }

            public bool open(string mode = "r") {
                if (!is_initialized()) {
                    return false;
                }

                /*if (!is_file()) {
                    return false;
                }*/

                if (this.handle != null) {
                    close();
                }

                switch (mode) {
                    case "r": handle = new PHYSFS.File.open_read  (this.name); break;
                    case "w": handle = new PHYSFS.File.open_write (this.name); break;
                    case "a": handle = new PHYSFS.File.open_append(this.name); break;
                }
                flush();

                return this.handle != null;
            }

            public bool flush() {
                if (is_file()) {
                    return handle.flush();
                }
                return false;
            }

            public void close() {
                this.name = "";
                this.handle = null;
            }

            public int64 tell() {
                if (is_file()) {
                    return handle.tell();
                }

                return -1;
            }

            public int seek(uint64 position) {
                if (is_file()) {
                    return handle.seek(position);
                }

                return -1;
            }

            public int64 read(uint8[] buffer, uint64 length) {
                if (is_file()) {
                    return handle.read_bytes(buffer, length);
                }
                return -1;
            }

            public string read_line() {
                string line = "";
                if (is_file()) {
                    char[] buffer = { 0 };
                    while (!eof()) {
                        if (read((uint8[])buffer, sizeof(char)) > 0) {
                            if (buffer[0] == '\0' || buffer[0] == '\n') {
                                break;
                            }

                            if (buffer[0] != '\r') {
                                line += buffer[0].to_string();
                            }
                        }
                    }
                }

                return line;
            }

            public string[] read_lines() {
                string[] lines = {};

                if (is_file()) {
                    while (!eof()) {
                        lines += read_line();
                    }
                }

                return lines;
            }

            public int64 write(uint8[] buffer) {
                if (is_file()) {
                    int64 writed = handle.write_bytes(buffer);
                    if (writed != buffer.length) {
                        stderr.printf("Error when write data to file! " + get_last_error() + "\n");
                    }
                    return writed;
                }
                return -1;
            }

            public int64 write_int(int value) {
                return write_string(value.to_string());
            }

            public int64 write_bool(bool value) {
                return write_string(value.to_string());
            }

            public int64 write_string(string str) {
                if (is_file()) {
                    return write(str.data);
                }
                return -1;
            }

            public int64 write_lines(string[] lines) {
                int64 bytes = 0;
                if (is_file()) {
                    foreach (string line in lines) {
                        bytes += write_string(line + "\n");
                    }
                    if (bytes < 0) {
                        bytes = -1;
                    }
                    return bytes;
                }
                return -1;
            }

            public bool eof() {
                if (is_file()) {
                    return handle.eof();
                }
                return true;
            }
        }
    }
}
