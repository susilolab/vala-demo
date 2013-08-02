// valac --pkg gtk+-3.0 hello.vala

using Gtk;

int main(string[] args) {
	Gtk.init (ref args);
	
	var window             = new Window ();
	window.title           = "Contoh Radio Button";
	window.border_width    = 1;
	window.window_position = WindowPosition.CENTER;

	// window.set_default_size (350,70);
	window.destroy.connect(Gtk.main_quit);
	var box = new Box(Orientation.HORIZONTAL, 0);

	var radio1 = new RadioButton(null);
	radio1.set_label("Button 1");

	var radio2 = new RadioButton.with_label(radio1.get_group(), "Button 2");
	var radio3 = new RadioButton.with_label_from_widget(radio1, "Button 3");

	box.pack_start(radio1, false, false, 0);
	box.pack_start(radio2, false, false, 0);
	box.pack_start(radio3, false, false, 0);

	window.add(box);
	window.show_all();
	Gtk.main();
	return 0;
}
