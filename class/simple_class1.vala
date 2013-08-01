public class SimpleClass: Object
{
	public string nama;
	public int umur;

	// Konstruktor
	public SimpleClass() {
		this.nama = "Agus Susilo";
		this.umur = 28;
	}

	public string[] get_list_saudara() {
		return { "Muji", "Endang", "Wahid", "Siti" };
	}

	public void run() {
		stdout.printf("Nama: %s\n", this.nama);
		stdout.printf("Umur: %d\n", this.umur);
		stdout.printf("Saudara:\n");
		
		foreach(string saudara in get_list_saudara()) {
			stdout.printf("%s\n", saudara);
		}
	}

	public static int main(string[] args) {
		var simple_class = new SimpleClass();
		simple_class.run();

		return 0;
	}
}