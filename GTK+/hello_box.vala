// valac --pkg gtk+-3.0 hello.vala

using Gtk;

int main(string[] args) {
	Gtk.init (ref args);
	
	var window             = new Window ();
	window.title           = "Contoh Box Layout";
	window.border_width    = 1;
	window.window_position = WindowPosition.CENTER;

	//window.set_default_size (350,70);
	window.destroy.connect(Gtk.main_quit);
	
	var box = new Box(Orientation.HORIZONTAL, 0);
	var label  = new Label("Username: ");
	var entry  = new Entry();
	var button = new Button.with_label("Submit");

	box.pack_start(label, false, false, 0);
	box.pack_start(entry, false, false, 0);
	box.pack_start(button, false, false, 0);

	window.add(box);
	window.show_all();
	Gtk.main();

	return 0;
}
