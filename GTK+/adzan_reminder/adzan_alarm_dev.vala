/**
 * Set icon to application
 * @created 5 Agustus 2012, 22:16
 * valac --pkg gtk+-3.0 --pkg gmodule-2.0 adzan_alarm_dev.vala
 */

using Gtk;


int main(string[] args) {
	Gtk.init(ref args);

	try{
		var builder = new Builder();
		builder.add_from_file("adzan_alarmv0.1.ui");
		builder.connect_signals(null);
		var window = builder.get_object("main_window") as Window;
		window.show_all();
		Gtk.main();

	}catch(Error e) {
		return 1;
	}

	return 0;
}
