/**
 * Komentar program
 */
using Gtk;

int main (string[] args) {
	Gtk.init(ref args);

	var window = new Window ();
	window.title = "Contoh expander";
	window.window_position = WindowPosition.CENTER;
	window.set_default_size (350,70);
	window.destroy.connect(Gtk.main_quit);

	var notebook = new Notebook();
	var label1 = new Label("Page one");
	var label2 = new Label("Page two");
	var child1 = new Button.with_label("Go to page 2");
	var child2 = new Button.with_label("Go to page 1");

	child1.clicked.connect( () => {
		switch_page(notebook);
	});

	child2.clicked.connect( () => {
		switch_page(notebook);
	});

	notebook.append_page(child1, label1);
	notebook.append_page(child2, label2);

	notebook.set_tab_pos(PositionType.BOTTOM);
	window.add(notebook);
	window.show_all();

	Gtk.main();
	//stdout.printf("Hello World");
    return 0;
}

public static void switch_page(Notebook nb) {
	if( nb.get_current_page() == 0) {
		nb.set_current_page(1);
	}else {
		nb.set_current_page(0);
	}
}
