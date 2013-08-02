/**
 * Contoh widgets dalam GTK+ vala
 */

using Gtk;

class PengingatAdzan : Window
{
	public PengingatAdzan() {
		this.title = "Contoh widgets pada GTK+ Vala";
		this.border_width = 10;
		this.window_position = WindowPosition.CENTER;
		this.set_default_size (400,300);
		this.destroy.connect(Gtk.main_quit);

		var table1 = new Table(3, 2, false);
		table1.set_col_spacings(2);
		table1.set_row_spacings(2);
		add(table1);

		var label1 = new Label("Name");
		var entry1 = new Entry();
		var button = new Button.with_label("Ini button");
		var checkbox = new CheckButton.with_label("Show title");
		checkbox.toggled.connect(this.show_window_title);

		table1.attach_defaults(label1, 0, 1, 0, 1);
		table1.attach_defaults(entry1, 1, 2, 0, 1);
		table1.attach_defaults(button, 0, 1, 1, 2);
		table1.attach_defaults(checkbox, 1, 2, 1, 2);
	}

	private void show_window_title(ToggleButton checkbutton) {
		if(checkbutton.get_active()) {
			this.set_title("Contoh widgets pada GTK+ Vala");
		}else {
			this.set_title("");
		}
	}

	static int main(string[] args) {
		Gtk.init(ref args);

		var win = new PengingatAdzan();
		win.show_all();

		Gtk.main();
    	return 0;
	}
}
