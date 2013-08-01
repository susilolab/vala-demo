/**
 * latihan008.vala
 * 2012-09-22 23:30
 * Kelas dasar 2 pada vala
 */

// Cara 2, main berada di dalam kelas dan main menjadi static
public class BasicSample: Object {
	public void run() {
		stdout.printf("Hello World\n");
	}

	static int main (string[] args) {
		var sample = new BasicSample();
		sample.run();
		return 0;
	}
}
