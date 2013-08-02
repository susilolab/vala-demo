// valac --pkg gtk+-3.0 iconview_demo.vala
using Gtk;

public class IconViewSample: Window
{
	public IconViewSample() {
		this.title = "TreeView Sample";
		set_default_size(250, 100);
		var view = new IconView();
		setup_iconview(view);
		add(view);
		this.destroy.connect(Gtk.main_quit);
	}

	public void setup_iconview(IconView view) {
		var listmodel = new ListStore(1, typeof(IconSet));
		view.set_model(listmodel);
		view.set_pixbuf_column(0);

		string[] icons = {
			Stock.OPEN,
			Stock.NEW,
			Stock.SAVE,
			Stock.CLOSE,
			Stock.PRINT
		};

		foreach(
	}

	public static int main(string[] args) {
		Gtk.init(ref args);

		var app = new IconViewSample();
		app.show_all();
		Gtk.main();

		return 0;
	}
}
