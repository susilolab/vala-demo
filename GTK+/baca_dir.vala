string name;
var d = Dir.open("/home/susilo");
while( (name = d.read_name()) != null ) {
	stdout.printf("dir: %s\n", name);
}