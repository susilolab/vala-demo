// valac --pkg gtk+-3.0 hello_app.vala
class HelloApplication: Gtk.Application
{
	public HelloApplication() {
		Object(application_id: "org.example.application");
	}

	protected override void activate() {
		var window = new Gtk.Window();
		window.title = "Welcome to GNOME";
		window.set_default_size(350, -1);
		window.window_position = Gtk.WindowPosition.CENTER;
		this.add_window(window);
		window.show();
	}

	static int main(string[] args) {
		return new HelloApplication().run(args);
	}
}