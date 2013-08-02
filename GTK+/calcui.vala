// valac --pkg gtk+-3.0 hello.vala

using Gtk;

public class UiSample: Object
{
	private Builder builder;
	private Window main_window;
	private Label label_error;
	private Entry e1;
	private Entry e2;
	private Entry e3;
	private Button btn_jml;
	private Button btn_kali;
	private Button btn_quit;

	public UiSample() {
		init();
		try {
			main_window.icon = new Gdk.Pixbuf.from_file("basic.png");
			main_window.icon = IconTheme.get_default().load_icon("basic", 48, 0);

		}catch(Error e) {
			stderr.printf("Could not load application icon: %s", e.message);
		}
	}

	public void init() {
		try {
			builder = new Builder();
			builder.add_from_file("calc_ui.ui");
			builder.connect_signals(null);
			this.main_window = builder.get_object("window1") as Window;
			this.label_error = builder.get_object("label_error") as Label;

			this.main_window.destroy.connect(Gtk.main_quit);
			this.main_window.title           = "Kalkulator";
			this.main_window.window_position = WindowPosition.CENTER;
			this.main_window.show_all();
			builder.connect_signals(this);

			this.e1 = this.builder.get_object("e_nilai1") as Entry;
			this.e1.max_length = 20;

			this.e2 = this.builder.get_object("e_nilai2") as Entry;
			this.e2.max_length = 20;

			this.e3 = this.builder.get_object("e_hasil") as Entry;
			this.e3.editable = false;
			this.e3.max_length = 20;

			this.btn_quit = this.builder.get_object("btn_quit") as Button;
			this.btn_quit.clicked.connect(Gtk.main_quit);

			this.btn_jml = this.builder.get_object("btn_jml") as Button;
			this.btn_jml.clicked.connect(btn_jml_clicked);

			this.btn_kali = this.builder.get_object("btn_kali") as Button;
			this.btn_kali.clicked.connect(btn_kali_clicked);

			this.clear_error();

		}catch(Error e) {
			stderr.printf("%s\n", e.message);
		}
	}

	public void btn_quit_clicked() {
		//Gtk.main_quit;
	}

	public void btn_jml_clicked() {
		if(this.is_validate()) {
			this.clear_error();

			int a     = int.parse(this.e1.text);
			int b     = int.parse(this.e2.text);
			int hasil = a+b;

			this.e3.text = hasil.to_string();
		}
	}

	public void btn_kali_clicked() {
		if(this.is_validate()) {
			this.clear_error();

			int a     = int.parse(this.e1.text);
			int b     = int.parse(this.e2.text);
			int hasil = a*b;

			this.e3.text = hasil.to_string();
		}
	}

	public bool is_validate() {
		string msg = "";
		bool valid = true;
		if(this.e1.text == "") {
			msg   = msg + "Nilai 1 wajib di isi.\n";
			valid = false;
		}

		if(this.e2.text == "") {
			msg   = msg + "Nilai 2 wajib di isi.\n";
			valid = false;
		}

		if(valid == false) {
			this.label_error.label = msg;
		}
		return valid;
	}

	public void clear_error() {
		this.label_error.label = "";
	}

	public static int main(string[] args) {
		Gtk.init (ref args);
		var app = new UiSample();

		Gtk.main();
		return 0;
	}
}
