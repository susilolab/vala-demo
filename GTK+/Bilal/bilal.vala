// valac --pkg gtk+-3.0 helo.vala
using Gtk;

class Bilal: Window
{
	public Bilal() {
		this.title           = "Bilal Pengingat Adzan";
		// , Pengingat Adzan dan Waktu Sholat
	    this.border_width    = 1;
	    this.window_position = WindowPosition.CENTER;
	    this.set_default_size(400, 300);
	    this.destroy.connect(Gtk.main_quit);

		var vbox   = new VBox(false, 5);

		var valign = new Alignment(0, 1, 0, 0);
		vbox.add(valign);
		add(vbox);

		var hbox = new HBox(true, 3);

		var ok_button = new Button.with_label("OK");
		ok_button.set_size_request(70, 30);
		hbox.add(ok_button);

		var close_button = new Button.with_label("Close");
		hbox.add(close_button);

		var halign = new Alignment(1, 0, 0, 0);
		halign.add(hbox);

		vbox.pack_start(halign, false, false, 0);
	}

	public void init() {
	}

	static int main (string[] args) {
	    Gtk.init(ref args);

	    var app = new Bilal();
	    app.show_all();

	    Gtk.main();
	    return 0;
	}
}
