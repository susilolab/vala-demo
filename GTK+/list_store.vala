int main (string[] args) {
	Gtk.ListStore list_store = new Gtk.ListStore(1, typeof(string));
	Gtk.TreeIter iter;

	list_store.append(out iter);
	list_store.set(iter, 0, "Vita", 1);
	list_store.append(out iter);
	list_store.set(iter, 0, "Sari", 1);

	Gtk.TreeModelForeachFunc print_row = (model, path, iter) => {
		GLib.Value cell1;

		list_store.get_value(iter, 0, out cell1);

		stdout.printf("%s\n", (string)cell1);
		return false;
	};

	list_store.foreach (print_row);
    return 0;
}

//  valac --pkg gtk+-3.0 --pkg gdk-3.0  screenshot.vala
