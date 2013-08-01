class Contoh
{
	public Contoh() {
	}

	public void tukar(ref int a, ref int b) {
		int tmp;
		tmp = a;
		a = b;
		b = tmp;

		stdout.printf("tukar(): a= %d\n", a);
		stdout.printf("tukar(): b= %d\n", b);
	}

	static int main (string[] args) {
		int a, b;
		var run = new Contoh();
		a = 10;
		b = 20;

		stdout.printf("main(): a= %d\n", a);
		stdout.printf("main(): b= %d\n", b);
		run.tukar(a, b);

		stdout.printf("main(): a= %d\n", a);
		stdout.printf("main(): b= %d\n", b);
		return 0;
	}
}
