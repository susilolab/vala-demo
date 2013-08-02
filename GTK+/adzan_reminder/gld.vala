/**
 * Set icon to application
 * @created 5 Agustus 2012, 22:16
 * valac --pkg gtk+-3.0 --pkg gmodule-2.0 adzan_alarm.vala
 */

using Gtk;


int main(string[] args) {
	Gtk.init(ref args);

	try{
		var builder = new Builder();
		builder.add_from_file("adzan.ui");
		builder.connect_signals(null);
		var window = builder.get_object("window1") as Window;
		window.show_all();
		Gtk.main();

	}catch(Error e) {
		return 1;
	}

	return 0;
}
