from gi.repository import Bodhi

engine = Bodhi.Engine
engine.start(1024, 768, False, False)
rm = engine.get_resource_manager()

# create file and put 5 strings
file = rm.new_file("test.txt", "w")
for i in range(5) :
    file.write_string("Hello, user" + str(i) + "!\n")
file.close()

# read first line from file
file = rm.new_file("test.txt", "r")
string = file.read_line()
print("Line readed from file - \"" + string + "\"")

# read all lines from file
file.seek(0)
lines = file.read_lines()
print("Lines readed from file:")
for line in lines :
    print(line)
file.close()

# append lines to file
file = rm.new_file("test.txt", "a")
file.write_lines(lines)
file.close()

engine.stop()
