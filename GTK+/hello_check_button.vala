// valac --pkg gtk+-3.0 hello.vala

using Gtk;

int main(string[] args) {
	Gtk.init (ref args);
	
	var window             = new Window ();
	window.title           = "Contoh Check Button";
	window.border_width    = 1;
	window.window_position = WindowPosition.CENTER;

	// window.set_default_size (350,70);
	window.destroy.connect(Gtk.main_quit);
	
	var check_button = new CheckButton.with_label("Check Button");

	window.add(check_button);
	window.show_all();
	Gtk.main();
	return 0;
}
