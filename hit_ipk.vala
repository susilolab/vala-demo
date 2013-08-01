class PenghitungIpk: Object
{
	public int pilihan;
	public int total_sks;
	public int jml_matkul;

	struct NilaiHuruf {
		public double NilA;
		public double NilB;
		public double NilBp;
		public double NilC;
		public double NilCp;
		public double NilD;
		public double NilE;
	}

	public PenghitungIpk() {
	}

	public void printMenu() {
		stdout.printf("+-----------------------------------------------------------------------+\n");
		stdout.printf("|         Penghitung Nilai IPK                                          |\n");
		stdout.printf("+-----------------------------------------------------------------------+\n");
		stdout.printf("| 1. Input data                                                         |\n");
		stdout.printf("| 2. Exit                                                               |\n");
		stdout.printf("+-----------------------------------------------------------------------+\n");
		stdout.printf("Masukan pilihan kamu [1-2]: ");
		this.pilihan = int.parse(stdin.read_line());
	}

	public void run() {
		NilaiHuruf nilai = NilaiHuruf() {
			NilA = 4,
			NilBp = 3.5,
			NilB = 3,
			NilCp = 2.5,
			NilC = 2,
			NilD = 1,
			NilE = 0
		};

		stdout.printf("Masukan jumlah SKS: ");
		this.total_sks = int.parse(stdin.read_line());

		stdout.printf("Masukan jumlah Mata Kuliah: ");
		this.jml_matkul = int.parse(stdin.read_line());

		List<int> data_nilai = new List<int>();
		List<int> data_sks = new List<int>();
		int i = 0;
		int j;
		double k;
		for(i=0; i<this.jml_matkul; i++) {
			stdout.printf("Masukan nilai ke-%d: ", i);
			j = int.parse(stdin.read_line());
			data_nilai.append(j);

			stdout.printf("Masukan jumlah SKS ke-%d: ", i);
			j = int.parse(stdin.read_line());
			data_sks.append(j);
		}
	}

	static void main() {
		PenghitungIpk app = new PenghitungIpk();
		app.run();
	}
}