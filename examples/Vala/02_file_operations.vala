using Bodhi;

public class Test : Object {

    public static int main (string[] args) {
        Engine.start ();

        // create file and put 5 strings
        var file = FileSystem.new_file("test.txt", "w");
        for (int i = 0; i < 5; ++i) {
            file.write_string("Hello, user" + i.to_string() + "!\n");
        }
        file.close();

        // read first line from file
        file = FileSystem.new_file("test.txt", "r");
        string str = file.read_line();
        stdout.printf("Line readed from file - \"" + str + "\"\n");

        // read all lines from file
        file.seek(0);
        string[] lines = file.read_lines();
        stdout.printf("Lines readed from file:\n");
        foreach (string line in lines) {
            stdout.printf(line + "\n");
        }
        file.close();

        // append lines to file
        file = FileSystem.new_file("test.txt", "a");
        file.write_lines(lines);
        file.close();

        Engine.stop();

        return 0;
    }
}

