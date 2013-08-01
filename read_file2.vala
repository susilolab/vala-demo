//valac read_file2.vala

int main(string[] args) {
	var fp = GLib.FileStream.open("regex.vala", "r");
	stdout.printf("%s\n", fp.read_line());
/* 	while(false == fp.eof()) {
		stdout.printf("%s\n", fp.read_line());
	} */
	return 0;
}
