/**
 * Komentar program
 */
using Gtk;
public static void button_toggled(ToggleButton own, ToggleButton other) {
	other.set_sensitive(!own.get_active());
}

int main (string[] args) {
	Gtk.init(ref args);

	var window = new Window ();
	window.title = "Contoh toggle button";
	window.window_position = WindowPosition.CENTER;
	window.set_default_size (350,70);
	window.destroy.connect(Gtk.main_quit);

	var vbox = new Box(Orientation.VERTICAL, 5);
	var toggle1 = new ToggleButton.with_mnemonic("Deactive the other one");
	var toggle2 = new ToggleButton.with_mnemonic("No! Deactive the other one");

	toggle1.toggled.connect( () => {
		button_toggled(toggle1, toggle2);
	});

	toggle2.toggled.connect( () => {
		button_toggled(toggle2, toggle1);
	});

	vbox.pack_start(toggle1);
	vbox.pack_start(toggle2);

	window.add(vbox);
	window.show_all();

	Gtk.main();
	//stdout.printf("Hello World");
    return 0;
}

public static void switch_page(Notebook nb) {
	if( nb.get_current_page() == 0) {
		nb.set_current_page(1);
	}else {
		nb.set_current_page(0);
	}
}
