public class Halo: Object
{
	public void run() {
		stdout.printf("Halo\n");
	}

	static int main(string[] args) {
		var halo = new Halo();
		halo.run();
		return 0;
	}
}
