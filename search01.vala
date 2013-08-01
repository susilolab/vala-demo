class Search01: Object
{
    public int jml_data = 0;
    public List<int> data;
    public Search01() {
    }

    private List<int> cari(int x) {
        int i = 0;
        var result = new List<int>();
        foreach (int j in this.data) {
            if(j == x) {
                result.append(j);
            }
        }
        return result;
    }

    public void run() {
        int x, y;
        stdout.printf("Jumlah data: ");
        this.jml_data = int.parse(stdin.read_line());

        this.data = new List<int> ();
        for(x=0; x < this.jml_data; x++) {
            stdout.printf("Data ke-%d: ", x);
            y = int.parse(stdin.read_line());
            this.data.append(y);
        }

        stdout.printf("Masukan angka yg dicari: ");
        int q = int.parse(stdin.read_line());

        var result = new List<int>();
        result = this.cari(q);
        if(result != null) {
	        foreach(int i in result) {
	            stdout.printf("%d\n", i);
	        }

        }else {
        	stdout.printf("Tidak ketemu");
        }
    }

    static void main() {
        var app = new Search01();
        app.run();

        stdout.printf("\n");
    }
}