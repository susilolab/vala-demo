/**
 * latihan005.vala
 * 2012-09-22 24:14
 * Contoh membaca dan menulis file txt
 */

void main () {
	try {
		string filename = "data.txt";
		string content = "hello, world";
		FileUtils.set_contents(filename, content);

		// Membaca file
		string read;
		FileUtils.get_contents(filename, out read);
		stdout.printf("The contents of file '%s' is: \n%s\n", filename, read);

	}catch(FileError e) {
		stderr.printf("%s\n", e.message);
	}
}
