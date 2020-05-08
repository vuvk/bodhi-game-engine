namespace Bodhi {

    public class Log : SubSystem {

        private string? output_file_name;
        private bool write_to_file;
        private Bodhi.File? output_file;

        internal Log(string? output_file_name = null, bool truncate_file = false) {
            base();
            subsystem_name = "Log System";
        }

        ~Log() {
            deinit();
        }

        protected override Errors init() {
            return Errors.NO_ERROR;
        }

        internal override void deinit() {
            base.deinit();
            set_write_to_file(null);
        }

        public string get_output_file_name() {
            return output_file_name;
        }

        public bool is_write_to_file() {
            return write_to_file;
        }

        /**
         * set writing output to file.
         * If you want disable writing then set output_file_name to null or ""
         */
        public void set_write_to_file(string? output_file_name, bool truncate_file = false) {
            output_file = null;

            // if output file name is empty then it can't write
            this.output_file_name = null;
            write_to_file = (output_file_name != null && output_file_name != "");

            if (write_to_file) {
                string mode = (truncate_file) ? "w" : "a";
                output_file = FileSystem.new_file(output_file_name, mode);

                if (output_file != null) {
                    this.output_file_name = output_file_name;
                    this.write_to_file    = true;

                    var now = new DateTime.now_local();
                    output_file.write_string("\n\n...start logging at " + now.format("%Y-%m-%d %H:%M:%S") + "...\n\n");
                    output_file.flush();
                } else {
                    write_to_file = false;
                }
            }
        }

        public void write(string message) {
            if (message.length  > 0) {
                stdout.printf(message);

                if (write_to_file && output_file != null) {
                    output_file.write_string(message);
                    output_file.flush();
                }
            }
        }

        public void write_error(string message) {
            write("ERROR! " + message);
        }

        public void write_warning(string message) {
            write("Warning! " + message);
        }
    }
}
