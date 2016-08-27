class ArrayDinamis: GLib.Object
{
	public ArrayDinamis() {
	}

	public void init() {
		// array string dinamis
		string[] bahasa = {};
		bahasa += "Vala";
		bahasa += "PHP";
		bahasa += "C";
		bahasa += "C++";

		stdout.printf("Jumlah element bahasa: %d\n", bahasa.length);
		foreach(string lang in bahasa) {
			stdout.printf("%s\n", lang);
		}

		int[] num = {};
		num += 1;
		num += 2;
		num += 3;
		stdout.printf("\nJumlah element num: %d\n", num.length);
		foreach(int i in num) {
			stdout.printf("%d\n", i);
		}
	}

	static int main(string[] args) {
		var app = new ArrayDinamis();
		app.init();

		return 0;
	}
}
