//valac --pkg gio-2.0 read_file.vala

int main(string[] args) {
	string title = """
Konversi kurs mata uang
1. Rp
2. AUD(Dollar Australia)
3. USD
	""";

	stdout.printf(title);
	var file = File.new_for_uri("http://www.bi.go.id/web/id/Moneter/Kurs+Bank+Indonesia/Kurs+Transaksi");
	if(!file.query_exists()) {
		stderr.printf("File '%s' doesn't exists\n", file.get_path());
		return 1;
	}

	try {
		var dis = new DataInputStream(file.read());
		string line;
		while( (line = dis.read_line(null)) != null) {
			//stdout.printf("%s\n", line);
		}
	}catch(Error e) {
		error("%s", e.message);
	}

	stdout.printf("\n");
	return 0;
}
