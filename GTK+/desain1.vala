// valac --pkg gtk+-3.0 hello.vala

using Gtk;

public class Sample: Window
{
	public Sample() {
		this.title           = "Adzan Alarm";
		this.border_width    = 1;
		this.window_position = WindowPosition.CENTER;

		this.set_default_size (350,70);
		this.destroy.connect(Gtk.main_quit);

		var label1 = new Label("2 Rabi' al-awwal, 1434 H");
		label1.set_alignment(0, 5);
		var box    = new Box(Orientation.VERTICAL, 2);
		box.pack_start(label1, false, false, 5);
		//box.pack_start(label2, false, false, 0);

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
