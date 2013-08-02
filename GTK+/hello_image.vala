// valac --pkg gtk+-3.0 hello_image.vala

class DemoImage: Gtk.ApplicationWindow
{
	internal DemoImage(MyApplication app) {
		Object(application: app, title: "Demo Image");
		this.set_default_size(400, 400);

		var image = new Gtk.Image();
		image.set_from_file("vita.png");
		this.add(image);
	}
}

class MyApplication: Gtk.Application
{
	internal MyApplication() {
		Object(application_id: "org.example.image");
	}

	protected override void activate() {
		new DemoImage(this).show_all();
	}

	static int main(string[] args) {
		return new MyApplication().run(args);
	}
}