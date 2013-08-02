using Gtk;

public class SampleBoxes: Window
{
	public SampleBoxes() {
		this.title = "Untitled";
		this.window_position = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		set_default_size(300, 300);

		var box = new Box(Gtk.Orientation.VERTICAL, 5);
		var button1 = new Button.with_label("Destroy Me");
		var button2 = new Button.with_label("Button 2: EXPAND, !FILL");
		var button3 = new Button.with_label("Destroy 3");
		var button4 = new Button.with_label("Destroy 4: !EXPAND");
		var button5 = new Button.with_label("Button 5");

		box.pack_start(button1);
		box.pack_start(button2, true, false);
		box.pack_start(button3);
		box.pack_start(button4, false);
		box.pack_start(button5);

		button1.clicked.connect( () => {
			button1.destroy();
		});
		add(box);
	}

	public static int main(string[] args) {
		Gtk.init(ref args);

		var window = new SampleBoxes();
		window.show_all();

		Gtk.main();
		return 0;
	}
}
