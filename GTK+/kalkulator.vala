// valac --pkg gtk+-3.0 hello.vala

using Gtk;

public class Sample: Window
{
	public Sample() {
		this.title           = "Kalkulator";
		this.border_width    = 1;
		this.window_position = WindowPosition.CENTER;

		//this.set_default_size (350,70);
		this.destroy.connect(Gtk.main_quit);

		var label1 = new Label("Angka 1: ");
		var label2 = new Label("Angka 2: ");
		var label3 = new Label("Hasil: ");
		
		var entry1 = new Entry();
		var entry2 = new Entry();
		var entry3 = new Entry();
		entry1.max_length = 5;
		entry1.placeholder_text = "Isi dengan angka";
		entry2.placeholder_text = "Isi dengan angka";
		entry2.max_length = 5;
		entry3.editable = false;

		var button = new Button.with_label("Jumlahkan");

		var table = new Table(4, 2, false);
		table.attach(label1, 0, 1, 0, 1, AttachOptions.SHRINK, AttachOptions.SHRINK, 0, 0);
		table.attach(label2, 0, 1, 1, 2, AttachOptions.SHRINK, AttachOptions.SHRINK, 0, 0);
		table.attach(label3, 0, 1, 2, 3, AttachOptions.SHRINK, AttachOptions.SHRINK, 0, 0);

		table.attach(entry1, 1, 2, 0, 1, AttachOptions.SHRINK, AttachOptions.SHRINK, 0, 0);
		table.attach(entry2, 1, 2, 1, 2, AttachOptions.SHRINK, AttachOptions.SHRINK, 0, 0);
		table.attach(entry3, 1, 2, 2, 3, AttachOptions.SHRINK, AttachOptions.SHRINK, 0, 0);
		
		table.attach(button, 1, 2, 3, 4, AttachOptions.SHRINK, AttachOptions.SHRINK, 0, 0);
		table.set_row_spacings(5);
		table.set_col_spacings(5);
		button.clicked.connect( () => {
			if(validate(entry1, entry2)==true) {
				int x = calc(entry1.text, entry2.text);
				entry3.text = x.to_string();

			}else {
				var dialog = new Gtk.MessageDialog(null,Gtk.DialogFlags.MODAL,Gtk.MessageType.INFO, 
					Gtk.ButtonsType.OK, "Data tidak lengkap.");
				dialog.set_title("Kalkulator");
				dialog.run();
				dialog.destroy();
			}
		});
		this.add(table);
	}

	public static int main(string[] args) {
		Gtk.init (ref args);

		var window = new Sample();
		window.show_all();

		Gtk.main();
		return 0;
	}

	public bool validate(Gtk.Entry e1, Gtk.Entry e2) {
		bool c = false;
		if(e1.text != "")
			c = true;

		if(e2.text != "")
			c = true;
		return c;
	}

	public int calc(string x, string y) {
		int z = 0;
		z = int.parse(x) + int.parse(y);
		return z;
	}
}
