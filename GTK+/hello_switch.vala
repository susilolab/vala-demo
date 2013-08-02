// valac --pkg gtk+-3.0 hello_switch.vala

class DemoSwitch: Gtk.ApplicationWindow
{
	internal DemoSwitch(MyApplication app) {
		Object(application: app, title: "Demo Switch");
		this.set_default_size(300, 100);
		this.border_width = 10;

		var label = new Gtk.Label("Title");
		var switcher = new Gtk.Switch();
		switcher.set_active(true);
		switcher.notify["active"].connect(switcher_cb);

		var grid = new Gtk.Grid();
		grid.set_column_spacing(10);
		grid.attach(label, 0, 0, 1, 1);
		grid.attach(switcher, 1, 0, 1, 1);

		this.add(grid);
	}

	void switcher_cb(Object switcher, ParamSpec pspec) {
		if((switcher as Gtk.Switch).get_active())
			this.set_title("Demo Switch");
		else
			this.set_title("");
	}
}

class MyApplication: Gtk.Application
{
	internal MyApplication() {
		Object(application_id: "org.example.checkbutton");
	}

	protected override void activate() {
		new DemoSwitch(this).show_all();
	}

	static int main(string[] args) {
		return new MyApplication().run(args);
	}
}