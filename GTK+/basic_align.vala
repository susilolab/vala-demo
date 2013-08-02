/**
 * Basic example of vala
 */

using Gtk;

int main(string[] args) {
	Gtk.init (ref args);

	var window = new Window ();
	window.title = "First GTK+ Program";
	window.border_width = 0;
	window.window_position = WindowPosition.CENTER;
	window.set_default_size (400,300);
	window.destroy.connect(Gtk.main_quit);

	var button = new Button.with_label("Click Me!");
	var aligns = new Alignment();
	aligns.set(0.25, 0.25, 0.25, 0.25);
	aligns.add(button);

	window.add(aligns);
	window.show_all();
	Gtk.main();

	return 0;
}
