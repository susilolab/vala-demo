/**
 * array.vala
 * Mendemokan cara membuat array
 */
void main () {
	int[] angka = {1,2,3,4,5};
	int[] stack = new int[10];

	string[] nama = {
		"Agus",
		"Susilo",
		"Novi",
		"Vita",
		"Permata sari"
	};

	foreach(var i in angka) {
		stdout.printf("%d\n", i);
	}

	stdout.printf("\n\n");
	foreach(var s in nama) {
		stdout.printf("%s\n", s);
	}

	stdout.printf("\n%d\n", stack.length);
}
