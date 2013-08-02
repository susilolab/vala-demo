// valac --pkg gtk+-3.0 hello_cbox.vala

class DemoCombox: Gtk.ApplicationWindow
{
	string[] distros = {"Select distribution", "Fedora", "Mint", "Suse"};

	enum Column {
		DISTRO
	}

	internal DemoCombox(MyApplication app) {
		Object(application: app, title: "Demo Combox Box");
		this.set_default_size(200, -1);
		this.border_width = 10;

		Gtk.ListStore liststore = new Gtk.ListStore(1, typeof(string));

		for(int i=0; i<distros.length; i++) {
			Gtk.TreeIter iter;
			liststore.append(out iter);
			liststore.set(iter, Column.DISTRO, distros[i]);
		}

		Gtk.ComboBox combobox = new Gtk.ComboBox.with_model(liststore);
		Gtk.CellRendererText cell = new Gtk.CellRendererText();
		combobox.pack_start(cell, false);
		combobox.set_attributes(cell, "text", Column.DISTRO);

		combobox.set_active(0);
		combobox.changed.connect(this.item_changed);
		this.add(combobox);
		combobox.show();
	}

	void item_changed(Gtk.ComboBox combo) {
		if(combo.get_active() != 0) {
			print("You choose " + distros[combo.get_active()] + "\n");
		}
	}
}

class MyApplication: Gtk.Application
{
	internal MyApplication() {
		Object(application_id: "org.example.MyApplication");
	}

	protected override void activate() {
		new DemoCombox(this).show();
	}

	static int main(string[] args) {
		return new MyApplication().run(args);
	}
}