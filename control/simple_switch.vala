public class SimpleSwitch: Object
{
	public int a;
	public int b;
	public int c;
	public SimpleSwitch() {
	}

	public int determinan(int a, int b, int c) {
		return (b*b - 4 * a * c);
	}

	public void rumus_abc(int a, int b, int c) {
		//rumus1 := (-b + sqrt(b*b) - 4 * a * c) / 2 * a;
		//ruaus2 := (-b - sqrt(b*b) - 4* a* c) / 2 * a; {sqrt hanya u/ n, kurung berubah}
		//write('maka nilai x1 - nya adalah ', rumus1:4:2);
		//writeln(' dan x2 - nya adalah ', rumus2:4:2);
	}

	public void run() {
		stdout.printf("1. Determinan\n");
		stdout.printf("2. Rumus abc\n");
		stdout.printf("Masukan pilihan Anda [1 - 2]: ");

		int jwb = int.parse(stdin.read_line());

		if(jwb >= 1 && jwb < 3) {
			switch(jwb) {
				case 1:
					read_data();
					stdout.printf("\nDeterminannya adalah: %d\n", determinan(a, b, c) );
					break;

				case 2:
					rumus_abc(a, b, c);
					break;
			}

		}else {
			stdout.printf("Maaf pilihan tidak ada.\n");
		}		
	}

	public void read_data() {
		stdout.printf("\n");
		stdout.printf("Masukan nilai a: ");
		a = int.parse(stdin.read_line());
		
		stdout.printf("Masukan nilai b: ");
		b = int.parse(stdin.read_line());

		stdout.printf("Masukan nilai c: ");
		c = int.parse(stdin.read_line());
	}

	public static int main(string[] args) {
		var program = new SimpleSwitch();
		program.run();
		return 0;
	}
}