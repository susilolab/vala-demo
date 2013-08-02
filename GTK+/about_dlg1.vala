using Gtk;

public class Window: Gtk.ApplicationWindow
{
	public Window(Application app) {
		Object (application: app, title: "AboutDialog Example");
		this.set_default_size(300, 100);

		var button = new Gtk.Button.with_label("About");
		button.margin = 10;
		button.clicked.connect(about_clicked);
		this.add(button);
		this.show_all();
	}

	void about_clicked() {
		string[] authors = {"GNOME Documentation Team", null};
		string[] documenters = {"GNOME Documentation Team", null};

		Gtk.show_about_dialog(this,
			"program-name", ("GtkApplication Example"),
			"copyright", ("Copyright \xc2\xa9 2012 GNOME Documentation Team"),
			"authors", authors,
			"documenters", documenters,
			"website", "http://www.tukangkoding.com",
			"website-label", ("Gnome Dev team"),
			null);
	}
}

public class Application: Gtk.Application
{
	protected override void activate() {
		new Window(this);
	}

	public Application() {
		Object (application_id: "org.example.application");
	}
}

int main(string[] args) {
	return new Application().run(args);
}
