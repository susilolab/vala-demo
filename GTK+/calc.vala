/**
 * Contoh edit text
 */

using Gtk;

class InputExample : Window
{
	public InputExample() {
		this.title = "Style app example";
		this.border_width = 10;
		this.window_position = WindowPosition.CENTER;
		this.set_default_size (350,70);
		this.destroy.connect(Gtk.main_quit);
	}

	static int main(string[] args) {
		Gtk.init(ref args);

		var win = new InputExample();
		win.show_all();

		Gtk.main();
    	return 0;
	}
}
