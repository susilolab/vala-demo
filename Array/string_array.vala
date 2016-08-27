public class Halo
{
	public void run() {
		stdout.printf("Halo\n");
		var x = this.daftar_lauk();
		foreach(string lauk in x) {
			stdout.printf(@"$lauk\n");
		}
	}

	public string[] daftar_lauk() {
		return {"Ayam", "Tempe", "Tahu"};
	}
	
	static int main(string[] args) {
		var halo = new Halo();
		halo.run();
		return 0;
	}
}
