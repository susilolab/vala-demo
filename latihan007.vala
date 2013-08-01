/**
 * latihan007.vala
 * 2012-09-22 23:26
 * Kelas dasar pada vala
 */

// Cara 1
public class BasicSample: Object {
	public void run() {
		stdout.printf("Hello World\n");
	}
}

int main (string[] args) {
	var sample = new BasicSample();
	sample.run();
	return 0;
}
