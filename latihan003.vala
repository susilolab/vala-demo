/**
 * latihan003.vala
 * Contoh fungsi matematika pada vala
 */

void main () {
	stdout.printf("Please enter the radius of circle: ");
	double radius = double.parse(stdin.read_line());

	stdout.printf("Circumference: %g\n", 2 * Math.PI * radius);
	stdout.printf("sin(pi/2) = %g\n", Math.sin(Math.PI / 2));

	// Random numbers
	stdout.printf("Angka random hari ini: ");
	for(int i=0; i<6; i++) {
		stdout.printf(" %d", Random.int_range(1, 49));
	}
	stdout.printf("\n");
	stdout.printf("Random number between 0 and 1: %g\n", Random.next_double());
}
