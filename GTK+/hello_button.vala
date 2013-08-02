// valac --pkg gtk+-3.0 hello.vala

using Gtk;

int main(string[] args) {
	Gtk.init (ref args);
	
	var window             = new Window ();
	window.title           = "Contoh button";
	window.border_width    = 1;
	window.window_position = WindowPosition.CENTER;

	window.set_default_size (350,70);
	window.destroy.connect(Gtk.main_quit);
	
	var button = new Button.with_label("Klik saya");

	window.add(button);
	window.show_all();
	Gtk.main();
	return 0;
}
