void main () {
	string kalimat;
	string kata = "Hallo ";
	stdout.printf("Masukan kata:");
	kalimat = stdin.read_line();

	if(kalimat != null) {
		stdout.printf("Uppercase dengan up(): %s\n", kalimat.up());
		stdout.printf("Lowecase dengan down(): %s\n", kalimat.down());
		stdout.printf("Jumlah huruf(except whitespace char): %d\n", kalimat.char_count());
		stdout.printf("Kata \"%s\" digabung dengan \"%s\": %s\n", kata, kalimat, kata.concat(kalimat));
		stdout.printf("Apakah kata \"%s\" mengandung huruf \"a\": %s\n",
			kalimat, kalimat.contains("a").to_string());

		if(kalimat.validate()) {
			stdout.printf("%s\n", kalimat.reverse());
		}
	}
}
