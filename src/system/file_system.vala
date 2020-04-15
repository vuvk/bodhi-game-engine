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

        public bool path_exists(string path) {
            return PHYSFS.exists(path);
        }

        public bool path_is_folder(string path) {
            if (path_exists(path)) {
                PHYSFS.Stat stat;
                if (PHYSFS.stat(path, out stat)) {
                    return stat.filetype == PHYSFS.FileType.DIRECTORY;
                } else {
                    print_last_error();
                }
            }

            return false;
        }

        public bool path_is_file(string path) {
            if (path_exists(path)) {
                PHYSFS.Stat stat;
                if (PHYSFS.stat(path, out stat)) {
                    return stat.filetype == PHYSFS.FileType.REGULAR;
                } else {
                    print_last_error();
                }
            }
            
            return false;
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

        /**
         * get file from system
         * @param path - path to file
         * @param mode - mode access. Possible values - "r" read, "w" write, "a" append
         */
        public File? new_file(string path, string mode = "r") {
            if (!is_initialized()) {
                return null;
            }

            return new File(path, mode);
        }


        /*
        * File class
        */
        public class File {
            private PHYSFS.File* handle;
            private string name = "";

            internal File(string path, string mode = "r") {
                name = path;
                open(mode);
            }
            
            ~File() {
                close();
            }
        
            public bool exists() {
                if (handle == null) {
                    return false;
                }
                return PHYSFS.exists(name);
            }

            public bool is_folder() {
                if (exists()) {
                    PHYSFS.Stat stat;
                    if (PHYSFS.stat(name, out stat)) {
                        return stat.filetype == PHYSFS.FileType.DIRECTORY;
                    }
                }
    
                return false;
            }
    
            public bool is_file() {
                //if (exists()) {
                    PHYSFS.Stat stat;
                    if (PHYSFS.stat(this.name, out stat)) {
                        return stat.filetype == PHYSFS.FileType.REGULAR;
                    }
                //}
                
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
                    return (PHYSFS.file_length(this.handle));
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
                /*if (is_file()) {
                    return false;
                }*/
            
                if (this.handle != null) {
                    close();
                }
            
                switch (mode) {
                    case "r": this.handle = PHYSFS.open_read(name); break;
                    case "w": this.handle = PHYSFS.open_write(name); break;
                    case "a": this.handle = PHYSFS.open_append(name); break;
                }

                return this.handle != null;
            }

            public void close() {
                if (this.handle != null) {
                    PHYSFS.close(this.handle);
                    this.handle = null;
                }
            
                this.name = "";
            }

            public int64 tell() {
                if (is_file()) {       
                    return (PHYSFS.tell(this.handle));
                }

                return -1;
            }

            public int seek(uint64 position) {
                if (is_file()) {     
                    return (PHYSFS.seek(this.handle, position));
                }

                return -1;
            }
            
            public int64 read(uint8[] buffer, uint64 length) {
                if (is_file()) {
                    return PHYSFS.read_bytes(handle, buffer, length);
                }
                return -1;
            }

            public int64 write(uint8[] buffer) {
                if (is_file()) {
                    return PHYSFS.write_bytes(handle, buffer);
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

            public bool eof() {
                if (this.handle != null && is_file()) {
                    return (PHYSFS.eof(this.handle));
                }
                return true;
            }
        }
    }
}
