public class Window: Gtk.ApplicationWindow
{
	public Window(Application app) {
		Object (application: app, title: "Gmenu Example");
		var about_action = new SimpleAction("about", null);
		var pref_action = new SimpleAction("pref", null);

		about_action.activate.connect(this.about_cb);

		this.add_action(about_action);
		this.add_action(pref_action);
		this.show();
	}

	void about_cb(SimpleAction simple, Variant? parameter) {
		print("This does nothing.\n");
	}
}

public class Application: Gtk.Application
{
	public Application() {
		Object (application_id: "org.example.application");
	}

	protected override void activate() {
		new Window(this);
	}

	protected override void startup() {
		base.startup();

		var menu = new Menu();
		menu.append("About", "win.about");
		menu.append("Preferences", "win.pref");
		menu.append("Quit", "app.quit");
		this.app_menu = menu;

		var quit_action = new SimpleAction("quit", null);
		this.add_action(quit_action);
	}
}

int main(string[] args) {
	return new Application().run(args);
}
