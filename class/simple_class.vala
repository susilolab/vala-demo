public class SimpleClass: Object
{
	// Konstruktor 1
	public SimpleClass() {
		stdout.printf("SimpleClass\n");
	}

	// Konstruktor 2
	public SimpleClass.pembangun_dua() {
		stdout.printf("SimpleClass.pembangun_dua\n");
	}

	// Konstruktor 3
	public SimpleClass.pembangun_tiga() {
		stdout.printf("SimpleClass.pembangun_tiga\n");
	}

	public void run() {
		stdout.printf("fungsi run(): Lari..\n");
	}

	public static int main(string[] args) {
		var simple_class = new SimpleClass();
		simple_class.run();

		var simple_class1 = new SimpleClass.pembangun_dua();
		var simple_class2 = new SimpleClass.pembangun_tiga();
		return 0;
	}
}