// valac --pkg gtk+-3.0 hello.vala

using Gtk;

public class UiSample: Object
{
	private Builder builder;
	private Window main_window;
	private Entry txt_jari;
	private Entry txt_hasil;
	private Entry txt_phi;
	private Button btn_hitung;
	private Button btn_quit;

	public UiSample() {
		init();
/* 		try {
			main_window.icon = new Gdk.Pixbuf.from_file("basic.png");
			main_window.icon = IconTheme.get_default().load_icon("basic", 48, 0);

		}catch(Error e) {
			stderr.printf("Could not load application icon: %s", e.message);
		} */
	}

	public void init() {
		try {
			builder = new Builder();
			builder.add_from_file("luas_lingk.glade");
			builder.connect_signals(null);
			main_window = builder.get_object("winLuasLingkaran") as Window;

			main_window.destroy.connect(Gtk.main_quit);
			main_window.title           = "Kalkulator";
			main_window.window_position = WindowPosition.CENTER;
			main_window.show_all();
			builder.connect_signals(this);

			btn_quit = builder.get_object("btnExit") as Button;
			btn_quit.clicked.connect(Gtk.main_quit);

			btn_hitung = builder.get_object("btnHitung") as Button;
			btn_hitung.clicked.connect(btn_hitung_clicked);

 			txt_jari = builder.get_object("entryJari") as Entry;
			txt_jari.max_length = 20;

			txt_phi = builder.get_object("entryPhi") as Entry;
			txt_phi.editable = false;
			txt_phi.max_length = 20;

			txt_hasil = builder.get_object("entryHasil") as Entry;
			txt_hasil.max_length = 20;
			txt_phi.text = "3.14";

		}catch(Error e) {
			stderr.printf("%s\n", e.message);
		}
	}

	public void btn_hitung_clicked() {
		float hasil = (float)txt_jari.text * (float)txt_phi.text;
		txt_hasil.text = hasil.to_string("%.2f");
	}

	public static int main(string[] args) {
		Gtk.init (ref args);
		var app = new UiSample();

		Gtk.main();
		return 0;
	}
}
