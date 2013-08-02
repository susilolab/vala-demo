// valac --pkg gtk+-3.0 hello.vala

using Gtk;
using Cairo;

public class Sample: Window
{
	private const int SIZE = 30;
	public Sample() {
		this.title           = "Tipe data";
		this.border_width    = 1;
		this.window_position = WindowPosition.CENTER;

		this.set_default_size (350,70);
		this.destroy.connect(Gtk.main_quit);
	}

	private void create_widgets() {
		var drawing_area = new DrawingArea();
		drawing_area.draw.connect(on_draw);
		add(drawing_area);
	}

	private bool on_draw(Widget da, Context ctx) {
		ctx.set_source_rgb(0, 0, 0);
		ctx.set_line_width(SIZE/4);
		ctx.set_tolerance(0.1);

		ctx.set_dash(null, 0);
		this.draw
		return true;
	}

	public static int main(string[] args) {
		Gtk.init (ref args);

		var window = new Sample();
		window.show_all();

		Gtk.main();
		return 0;
	}
}
