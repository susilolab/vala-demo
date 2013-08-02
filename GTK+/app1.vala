public class DemoApp: Gtk.Application
{
	public DemoApp() {
		Object(application_id: "app.demo.class",
			flags: ApplicationFlags.FLAGS_NONE);
	}

	protected override void activate() {
		Gtk.Window window = new Gtk.Window();
		window.set_title("Demo App");
		window.set_default_size(300, 210);
		window.destroy.connect( () => { Gtk.main_quit(); } );
		window.show_all();
		this.add_window(window);
	}

	public static int main (string[] args) {
		var app = new DemoApp();
		app.run();
		return 0;
	}
}
