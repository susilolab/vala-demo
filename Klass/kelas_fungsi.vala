class Kambing: GLib.Object
{
	int jml_kaki = 4;
	string warna = "Putih";
	
	public Kambing() {
	}
	
	public void cetak() {
		stdout.printf(warna + "\n");
	}
	
	public static int main(string[] args) {
		var kambing = new Kambing();
		kambing.cetak();
		stdout.printf("Hello World\n");
		return 0;
	}
}
