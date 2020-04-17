using Bodhi;

public class Test : Object {

    public static int main (string[] args) {
        Engine.start ();
        FileSystem fs = Engine.get_file_system();

        // create file and put 5 strings
        var file = fs.new_file("test.txt", "w");
        for (int i = 0; i < 5; ++i) {
            file.write_string("Hello, user" + i.to_string() + "!\n");
        }
        file.close();

        // read first line from file
        file = fs.new_file("test.txt", "r");
        string str = file.read_line();
        print("Line readed from file - \"" + str + "\"\n");

        // read all lines from file
        file.seek(0);
        string[] lines = file.read_lines();
        print("Lines readed from file:\n");
        foreach (string line in lines) {
            print(line + "\n");
        }
        file.close();

        // append lines to file
        file = fs.new_file("test.txt", "a");
        file.write_lines(lines);
        file.close();

        Engine.stop();

        return 0;
    }
}
