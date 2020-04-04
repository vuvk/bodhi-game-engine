public class Log : Object {

    private static DataOutputStream output_file_stream;
    private static string output_file_name = "";
    private static bool write_to_file = false;
    private static bool truncate = false;
    
    static void write(FileStream output, string message) {
        if (message.length  > 0) {
            output.printf(message);

            if (write_to_file && output_file_stream != null) {
                try {
                    output_file_stream.put_string(message);
                    output_file_stream.flush();
                } catch (Error err) {
                    stderr.printf("Error Code: " + ((int)err).to_string());
                }
            }
        }
    }

    public static void write_message(string message) {        
        write(stdout, message);
    }

    public static void write_error(string message) {
        write(stderr, "ERROR! " + message);
    }

    public static void write_warning(string message) {
        write(stdout, "Warning! " + message);
    }

    public static void set_output_file(string fileName) {
        output_file_name = fileName;
    }

    public static void set_truncate_output_file(bool truncate_file) {
        truncate = truncate_file;
    }

    public static void set_writing_to_file(bool writing_to_file) {
        if (writing_to_file) {
            if (output_file_name == null || output_file_name.length == 0) {
                write_error("Output file not specified!\n");
                write_to_file = false;
                return;
            } else {
                /* open/create file */
                try {
                    File file = File.new_for_path (output_file_name);
                    if (truncate && file.query_exists()) {
                        file.delete();
                    }
                    FileOutputStream fos = file.append_to(FileCreateFlags.PRIVATE);
                    output_file_stream = new DataOutputStream(fos);
                 } catch (Error err) {
                    stderr.printf("Error Code: " + ((int)err).to_string());
                    write_to_file = false;
                    return;
                }

                var now = new DateTime.now_local();
                try {
                    output_file_stream.put_string("\n\n...start logging at " + now.format("%Y-%m-%d %H:%M:%S") + "...\n\n");
                    output_file_stream.flush();
                } catch (Error err) {
                    stderr.printf("Error Code: " + ((int)err).to_string());
                }
            }
        } else {
            if (output_file_stream != null) {
                try {
                    output_file_stream.close();
                } catch (Error err) {
                    stderr.printf("Couldn't close output log. Error Code: " + ((int)err).to_string());
                }
                output_file_stream = null;
            }
        }

        write_to_file = writing_to_file;
    }

    public static bool is_truncate_output_file() {
        return truncate;
    }

}