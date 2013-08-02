// valac --pkg gtk+-3.0 hello.vala

using Gtk;

public class Sample: Window
{
	struct Vector {
		public double x;
		public double y;
		public double z;
	}

	public Sample() {
		int x;
		uint y;
		char nama;
		uchar uname = 'A';

		string full_name = "Agus Susilo";
		string verbatim = """
		""";

		this.title           = "Tipe data";
		this.border_width    = 1;
		this.window_position = WindowPosition.CENTER;

		this.set_default_size (350,70);
		this.destroy.connect(Gtk.main_quit);

		var label1 = new Label(int.MAX.to_string());
		var label2 = new Label(uint.MAX.to_string());
		var box    = new Box(Orientation.VERTICAL, 1);
		box.pack_start(label1, false, false, 0);
		box.pack_start(label2, false, false, 0);

		this.add(box);
	}

	public static int main(string[] args) {
		Gtk.init (ref args);

		var window = new Sample();
		window.show_all();

		Gtk.main();
		return 0;
	}
}
