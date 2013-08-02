/**
 * Demo cara menggunakan struct pada vala
 *
 * @created Kamis, 24 Januari 2013 11:21
 */

struct Warna {
	public double merah;
	public double kuning;
	public double hijau;
}
int main (string[] args) {
	//Warna w1 = Warna();
	//Warna w2 = { 0.5, 0.5, 1.0};
	Warna w3 = Warna() {
		merah = 0.2,
		kuning = 0.5,
		hijau = 1.0
	};

	stdout.printf("Warna merah= %.2f\n", w3.merah);
	stdout.printf("Warna kuning= %.2f\n", w3.kuning);
	stdout.printf("Warna hijau= %.2f\n", w3.hijau);

    stdout.printf("\n");
    return 0;
}