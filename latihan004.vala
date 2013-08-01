/**
 * latihan004.vala
 * Contoh argumen pd command line dan kode exit
 */

int main (string[] args) {
	stdout.printf("%d command line argument(s):\n", args.length);
	foreach(string arg in args) {
		stdout.printf("%s\n", arg);
	}

	// Kode exit(0 = success, 1 = failure)
	return 0;
}
