// valac --pkg gtk+-3.0 Kasir.vala Utils.vala

using Gtk;
using Utils;

public class KasirApp: Window
{
	private Builder builder;
	private Window main_window;

	public KasirApp() {
		init();
	}

	public void init() {
		try {
			builder = new Builder();
			builder.add_from_file("login.glade");
			builder.connect_signals(null);
			this.main_window = builder.get_object("window1") as Window;
			this.main_window.destroy.connect(Gtk.main_quit);
			this.main_window.title = "Aplikasi Kasir";
			this.main_window.show_all();
			builder.connect_signals(this);

			// this.btn_send     = this.builder.get_object("btn_send") as Button;
			// this.btn_send.clicked.connect(btn_send_clicked);
			// this.textview_msg = this.builder.get_object("textview_msg") as TextView;

		}catch(Error e) {
			stderr.printf("%s\n", e.message);
		}
	}

	public static int main(string[] args) {
		Gtk.init(ref args);

		var app = new KasirApp();
		Gtk.main();
		return 0;
	}
}
