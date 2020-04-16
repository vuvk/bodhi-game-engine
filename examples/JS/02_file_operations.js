const Bodhi = imports.gi.Bodhi;

Bodhi.Engine.start(1024, 768, true, false);
var fs = Bodhi.Engine.get_file_system();

// create file and put 5 strings
var file = fs.new_file("test.txt", "w");
for (var i = 0; i < 5; ++i) {
    file.write_string("Hello, user" + i + "!\n");
}
file.close();

// read first line from file
file = fs.new_file("test.txt", "r");
var str = file.read_line();
print("Line readed from file - \"" + str + "\"\n");

// read all lines from file
file.seek(0);
var lines = file.read_lines();
print("Lines readed from file:\n");
for (var line of lines) {
    print(line + "\n");
}
file.close();

// append lines to file
file = fs.new_file("test.txt", "a");
file.write_lines(lines);
file.close();

Bodhi.Engine.stop();
