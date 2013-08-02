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
	window.title = "About Dialog";
	window.window_position = WindowPosition.CENTER;
	window.set_default_size (200,50);
	window.destroy.connect(Gtk.main_quit);

	var button = new Button.with_label("Tentang Saya");
	var dlg = new AboutDialog();
	dlg.program_name = window.title;
	dlg.license_type = License.GPL_3_0;

	button.margin = 10;
	button.clicked.connect( () => {
		show_about_dialog(dlg, "program-name");
	});

	window.add(button);
	window.show_all();

	Gtk.main();
    return 0;
}
