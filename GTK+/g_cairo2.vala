// valac --pkg gtk+-3.0 --pkg cairo g_cairo1.vala
using Gtk;
using Cairo;

public class CairoSample: Gtk.Window
{
	private const double XC = 128.0;
	private const double YC = 128.0;
	private const double RADIUS = 100.0;
	private const double ANGLE1 = 45.0 * (Math.PI/180.0);
	private const double ANGLE2 = 180.0 * (Math.PI/180.0);

	public CairoSample() {
		this.title = "Cairo Sample";
		this.window_position = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		set_default_size(350, 350);
		create_widgets();
	}

	private void create_widgets() {
		var draw_area = new DrawingArea();
		draw_area.draw.connect(on_draw);
		add(draw_area);
	}

	private bool on_draw(Widget wd, Context ctx) {
		// Gambar garis hitam
		ctx.set_line_width(10.0);
		ctx.arc(XC, YC, RADIUS, ANGLE1, ANGLE2);
		ctx.stroke();

		ctx.set_source_rgba(1, 0.2, 0.2, 0.6);
		ctx.set_line_width(6.0);

		// Gambar lingkaran kecil
		ctx.arc(XC, YC, 10.0, 0, 2*Math.PI);
		ctx.fill();

		// Gambar garis 1
		ctx.arc(XC, YC, RADIUS, ANGLE1, ANGLE1);
		ctx.line_to(XC, YC);
		// Gambar garis 1
		ctx.arc(XC, YC, RADIUS, ANGLE2, ANGLE2);
		ctx.line_to(XC, YC);
		ctx.stroke();

		return true;
	}

	public static int main(string[] args) {
		Gtk.init(ref args);

		var cairo_sample = new CairoSample();
		cairo_sample.show_all();

		Gtk.main();
		return 0;
	}
}
