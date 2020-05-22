const Bodhi = imports.gi.Bodhi;

var engine = Bodhi.Engine;
engine.start(1024, 768, true, false);
var rm = engine.get_resource_manager();

// create file and put 5 strings
var file = rm.new_file("test.txt", "w");
for (var i = 0; i < 5; ++i) {
    file.write_string("Hello, user" + i + "!\n");
}
file.close();

// read first line from file
file = rm.new_file("test.txt", "r");
var str = file.read_line();
print("Line readed from file - \"" + str + "\"");

// read all lines from file
file.seek(0);
var lines = file.read_lines();
print("Lines readed from file:");
for (var line of lines) {
    print(line);
}
file.close();

// append lines to file
file = rm.new_file("test.txt", "a");
file.write_lines(lines);
file.close();

engine.stop();
