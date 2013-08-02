// valac --pkg gtk+-3.0 hello.vala
/**
 * Basic example of vala
 * > Icon
 * > Button
 */

using Gtk;

int main(string[] args) {
	Gtk.init (ref args);

	var window = new Window ();
	window.title = "First GTK+ Program";
	window.border_width = 2;
	window.window_position = WindowPosition.CENTER;
	window.set_default_size (350,70);
	window.destroy.connect(Gtk.main_quit);
	/*
	try {
		window.icon = new Gdk.Pixbuf.from_file("basic.png");
		window.icon = IconTheme.get_default().load_icon("basic", 48, 0);

	}catch(Error e) {
		stderr.printf("Could not load application icon: %s", e.message);
	}*/

	var button = new Button.with_label("Click Me!");
	button.clicked.connect(() => {
		button.label = "Thank you";
	});

	window.add(button);
	window.show_all();
	Gtk.main();
	return 0;
}
