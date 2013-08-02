// valac -X -mwindows --pkg gtk+-3.0 luas_lingkaran.vala
using Gtk;

class LuasLingkaran: Window
{
	private Builder builder;
	private Window win;
	private Button btn_hitung;
	private Button btn_keluar;
	private Entry txt_jari;
	private Entry txt_phi;
	private Entry txt_hasil;

	public LuasLingkaran() {
		try{
			builder = new Builder();
			builder.add_from_file("luas_lingkaran.glade");
			builder.connect_signals(null);

		}catch(Error e) {
			stderr.printf("%s\n", e.message);
		}
	}

	public void init() {
		win = builder.get_object("window1") as Window;
		win.title           = "Hitung Luas Lingkaran";
		win.window_position = WindowPosition.CENTER;
		win.destroy.connect(Gtk.main_quit);

		btn_keluar = builder.get_object("btn_keluar") as Button;
		btn_keluar.clicked.connect(Gtk.main_quit);
		btn_hitung = builder.get_object("btn_hitung") as Button;
		btn_hitung.clicked.connect(btn_hitung_clicked);

		txt_jari = builder.get_object("txt_jari") as Entry;
		txt_phi = builder.get_object("txt_phi") as Entry;
		txt_hasil = builder.get_object("txt_hasil") as Entry;
		txt_hasil.editable = false;

		win.show_all();
	}

	public void btn_hitung_clicked() {
		float result = (float)txt_jari.text * (float)txt_phi.text;
		txt_hasil.text = result.to_string("%.2f");
	}

	static int main (string[] args) {
	    Gtk.init(ref args);

	    var app = new LuasLingkaran();
	    app.init();

	    Gtk.main();
	    return 0;
	}
}
