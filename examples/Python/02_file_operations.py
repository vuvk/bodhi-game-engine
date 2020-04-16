from gi.repository import Bodhi

engine = Bodhi.Engine
engine.start(1024, 768, False, False)
fs = engine.get_file_system()

# create file and put 5 strings
file = fs.new_file("test.txt", "w")
for i in range(5) :
    file.write_string("Hello, user" + str(i) + "!\n")
file.close()

# read first line from file
file = fs.new_file("test.txt", "r")
string = file.read_line()
print("Line readed from file - \"" + string + "\"\n")

# read all lines from file
file.seek(0)
lines = file.read_lines()
print("Lines readed from file:\n")
for line in lines :
    print(line + "\n")
file.close()

# append lines to file
file = fs.new_file("test.txt", "a")
file.write_lines(lines)
file.close()

engine.stop()