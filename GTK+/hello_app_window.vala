// valac --pkg gtk+-3.0 hello_app.vala
public class HelloAppWindow: Gtk.Application
{
	protected override void activate() {
		var window = new Gtk.ApplicationWindow(this);

		window.title = "Welcome to GNOME";
		window.set_default_size(350, -1);
		window.window_position = Gtk.WindowPosition.CENTER;
		window.border_width = 5;

		var label = new Gtk.Label("Ini adalah contoh window dengan Gtk.ApplicationWindow bedanya dengan Gtk.Window adalah Gtk.ApplicationWindow didukung oleh Menus");
		label.wrap = true;
		window.add(label);
		window.show_all();
	}

	static int main(string[] args) {
		return new HelloAppWindow().run(args);
	}
}