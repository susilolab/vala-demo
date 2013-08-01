void main () {
	string kalimat;

	stdout.printf("Masukan sebuah kalimat:");
	kalimat = stdin.read_line();

	if(kalimat != null) {
		stdout.printf("Saya menulis: \"%s\" menggunakan bahasa Vala\n", kalimat);
	}
}
