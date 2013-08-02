/**
 * Set icon to application
 * @created 5 Agustus 2012, 22:16
 */

using Gtk;

int main(string[] args) {
	Gtk.init (ref args);

	var window = new Window ();
	window.title = "Set icon to app";
	// window.border_width = 0;
	window.window_position = WindowPosition.CENTER;
	window.set_default_size (350,70);
	window.destroy.connect(Gtk.main_quit);

	try {
		window.icon = new Gdk.Pixbuf.from_file("praytime.png");
		window.icon = IconTheme.get_default().load_icon("praytime", 48, 0);

	}catch(Error e) {
		stderr.printf("Could not load application icon: %s", e.message);
	}

	var button = new Button.with_label("Click Me!");
	button.clicked.connect(() => {
		button.label = "Thank you";
	});

	window.add(button);
	window.show_all();
	Gtk.main();
	return 0;
}
