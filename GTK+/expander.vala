/**
 * Komentar program
 */
using Gtk;

int main (string[] args) {
	Gtk.init(ref args);

	var window = new Window ();
	window.title = "Contoh expander";
	// window.border_width = 0;
	window.window_position = WindowPosition.CENTER;
	window.set_default_size (350,70);
	window.destroy.connect(Gtk.main_quit);

	var expander = new Expander.with_mnemonic("Click me for more!");
	var label = new Label("Hide me or show me, \nthat is your choice");
	expander.add(label);
	expander.set_expanded(true);

	window.add(expander);
	window.show_all();

	Gtk.main();
	//stdout.printf("Hello World");
    return 0;
}
