using Gtk;

public class TreeViewSample: Window
{
	public TreeViewSample() {
		this.title = "TreeView Sample";
		set_default_size(250, 100);
		var view = new TreeView();
		setup_treeview(view);
		add(view);
		this.destroy.connect(Gtk.main_quit);
	}

	private void setup_treeview(TreeView view) {
		var listmodel = new ListStore(4, typeof(string), typeof(string), typeof(string), typeof(string));
		view.set_model(listmodel);

		view.insert_column_with_attributes(-1, "Account Name", new CellRendererText(), "text", 0);
		view.insert_column_with_attributes(-1, "Type", new CellRendererText(), "text", 1);

		var cell = new CellRendererText();
		cell.set("foreground_set", true);
		view.insert_column_with_attributes(-1, "Balance", cell, "text", 2, "foreground", 3);

		TreeIter iter;
		listmodel.append(out iter);
		listmodel.set(iter, 0, "My Visacard", 1, "card", 2, "102,10", 3, "red");

		listmodel.append(out iter);
		listmodel.set(iter, 0, "My Visacard", 1, "card", 2, "10,20", 3, "red");
	}

	public static int main(string[] args) {
		Gtk.init(ref args);

		var app = new TreeViewSample();
		app.show_all();
		Gtk.main();

		return 0;
	}
}
