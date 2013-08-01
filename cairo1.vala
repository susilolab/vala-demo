// valac --pkg cairo cairo1.vala
using Cairo;

int main(string[] args) {
	ImageSurface img_surface = new ImageSurface(Cairo.Format.ARGB32, 240, 80);
	Context cx = new Context(img_surface);

	cx.select_font_face("serif", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
	cx.set_font_size(32.0);
	cx.set_source_rgb(0.0, 0.0, 1.0);
	cx.move_to(10.0, 50.0);
	cx.show_text("Hello Cairo");
	img_surface.write_to_png("hello_cairo1.png");
	return 0;
}
