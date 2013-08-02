// valac --pkg gtk+-3.0 signal1.vala
using Gtk;

public class DemoSignal: Window
{
	public DemoSignal() {
	}

	public void run() {
		this.title = "Demo Signal";
		this.border_width = 15;
		this.window_position = WindowPosition.CENTER;
		this.set_default_size (400,300);
		this.destroy.connect(Gtk.main_quit);

		var button = new Button.with_label("Cetak Kata");
		button.clicked.connect( () => {
			stdout.printf("kamu telah mengklik button..\n");
		});
		var box = new Box(Orientation.HORIZONTAL, 0);
		var aligns = new Alignment(0.25f, 0.25f, 0.25f, 0.25f);
		aligns.add(button);

		box.pack_start(aligns, false, false, 5);
		add(box);
		show_all();
	}

	public static int main(string[] args) {
		Gtk.init (ref args);
		DemoSignal app = new DemoSignal();
		app.run();

		Gtk.main();
		return 0;
	}
}
