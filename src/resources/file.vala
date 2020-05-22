namespace Bodhi {

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
                stderr.printf(FileSystem.get_last_error() + "\n");
            }
        }

        ~File() {
            close();
        }

        public bool is_folder() {
            if (FileSystem.is_initialized()) {
                PHYSFS.Stat stat;
                if (PHYSFS.stat(name, out stat)) {
                    return stat.filetype == PHYSFS.FileType.DIRECTORY;
                }
            }

            return false;
        }

        public bool is_file() {
            if (FileSystem.is_initialized()) {
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

        public bool is_eof() {
            if (is_file()) {
                return handle.eof();
            }
            return true;
        }

        public unowned string get_filename() {
            if (is_file()) {
                return name;
            }

            return "";
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

        public int64 get_size() {
            if (is_file()) {
                return handle.length();
            }

            return -1;
        }

        public int64 read_full(uint8[] buffer) {
            if (is_file()) {
                buffer.resize((int)get_size());
                return read(buffer, buffer.length);
            }

            return -1;
        }

        public bool open(string mode = "r") {
            if (!FileSystem.is_initialized()) {
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
                while (!is_eof()) {
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
                while (!is_eof()) {
                    lines += read_line();
                }
            }

            return lines;
        }

        public int64 write(uint8[] buffer) {
            return write_bytes(buffer, buffer.length);
        }

        public int64 write_bytes(uint8[] buffer, int64 count) {
            if (is_file()) {
                int64 writed = handle.write(buffer, 1, (uint32)count);
                if (writed != count) {
                    stderr.printf("Error when write data to file! " + FileSystem.get_last_error() + "\n");
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
    }
}
