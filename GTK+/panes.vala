using Gtk;

public class SamplePanes: Window
{
	public SamplePanes() {
		this.title           = "Panes";
		this.window_position = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		set_default_size(300, 300);
		
		var hpaned           = new Paned(Orientation.HORIZONTAL);
		var button1          = new Button.with_label("Resize");
		var button2          = new Button.with_label("Me");

		//button1.clicked.connect(this.destroy_with_parent);
		//button2.clicked.connect(this.destroy_with_parent);

		hpaned.add1(button1);
		hpaned.add2(button2);
	}

	public static int main(string[] args) {
		Gtk.init(ref args);

		var window = new SamplePanes();
		window.show_all();

		Gtk.main();
		return 0;
	}
}
