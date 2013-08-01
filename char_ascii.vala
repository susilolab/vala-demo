void main()
{
	stdout.printf("Masukan panjang: ");
	int p = int.parse(stdin.read_line());

	stdout.printf("Masukan lebar: ");
	int l = int.parse(stdin.read_line());

	for(int i=0; i<l; i++) {
		for(int j=0; j<p; j++) {
			if(j > 0 && j % 2 == 1) {
				stdout.printf(" ");
			}else {
				stdout.printf("Q");
			}
		}
		stdout.printf("\n");
	}
}
