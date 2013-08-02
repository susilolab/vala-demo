// valac --pkg gtk+-3.0 --pkg cairo g_cairo1.vala
using Gtk;
using Cairo;

public class CairoSample: Gtk.Window
{
	private const int SIZE = 30;
	public CairoSample() {
		this.title = "Cairo Sample";
		this.window_position = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		set_default_size(350, 450);

		create_widgets();
	}

	private void create_widgets() {
		var draw_area = new DrawingArea();
		draw_area.draw.connect(on_draw);
		add(draw_area);
	}

	private bool on_draw(Widget wd, Context ctx) {
		ctx.set_source_rgb(0, 0, 0);

		//ctx.set_line_width(SIZE / 4);
		ctx.set_tolerance(0.1);

		// LineJoin.MITER, LineJoin.ROUND, LineJoin.BEVEL
		ctx.set_line_join(LineJoin.BEVEL);
		ctx.set_dash(new double[] {SIZE/4.0, SIZE/4.0}, 0);
		stroke_shapes(ctx, 0, 0);

		return true;
	}

	private void stroke_shapes(Context ctx, int x, int y) {
		this.draw_shapes(ctx, x, y, ctx.stroke);
	}

	private delegate void DrawMethod();
	private void draw_shapes(Context ctx, int x, int y, DrawMethod draw_method) {
		ctx.save();

		ctx.new_path();
		ctx.translate(x + SIZE, y+SIZE);
		// bowtie
		ctx.move_to(0, 0);
		ctx.rel_line_to(2 * SIZE, 0);
		ctx.rel_line_to(0, 2 * SIZE);
		ctx.rel_line_to(-2 * SIZE, 0);
		ctx.close_path();
		draw_method();

		ctx.restore();
	}

	public static int main(string[] args) {
		Gtk.init(ref args);

		var cairo_sample = new CairoSample();
		cairo_sample.show_all();

		Gtk.main();
		return 0;
	}
}
