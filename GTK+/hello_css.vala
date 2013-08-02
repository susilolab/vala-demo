// valac --pkg gtk+-3.0 hello.vala

using Gtk;
using Gdk;

public class Sample: Gtk.Window
{
	public Sample() {
		this.title           = "Contoh Css Provider";
		this.border_width    = 1;
		this.window_position = WindowPosition.CENTER;

		//this.set_default_size (350,70);
		this.destroy.connect(Gtk.main_quit);

		var screen = Gdk.Screen.get_default();
		var label  = new Label("Nama Lengkap: ");
		var entry  = new Entry();
		var box    = new Box(Orientation.HORIZONTAL, 1);
		box.pack_start(label, true, true, 0);
		box.pack_start(entry, false, false, 0);

		var style_context = this.get_style_context();
		var css_provider = new CssProvider();
		try {
			css_provider.load_from_path("hello_css.css");
		}catch(Error e) {
			stdout.printf("%s\n", e.message);
		}

		style_context.add_provider_for_screen(screen, css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
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