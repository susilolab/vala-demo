//valac --pkg gio-2.0 read_file.vala

int main(string[] args) {
	var file = File.new_for_path("notify.vala");
	if(!file.query_exists()) {
		stderr.printf("File '%s' doesn't exists\n", file.get_path());
		return 1;
	}

	try {
		var dis = new DataInputStream(file.read());
		string line;
		while( (line = dis.read_line(null)) != null) {
			stdout.printf("%s\n", line);
		}
	}catch(Error e) {
		error("%s", e.message);
	}

	return 0;
}
