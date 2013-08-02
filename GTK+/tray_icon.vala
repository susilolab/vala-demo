// valac --pkg gtk+-3.0 hello.vala

using Gtk;

class AppStatusIcon: Window
{
	private Gtk.StatusIcon tray_icon;
	private Gtk.Menu menu_system;

	public AppStatusIcon() {
		tray_icon = new Gtk.StatusIcon.from_stock(Stock.HOME);
		tray_icon.set_tooltip_text("Tray");
		tray_icon.set_visible(true);

		tray_icon.activate.connect(about_clicked);
		create_menu_system();
		tray_icon.popup_menu.connect(menu_system_popup);
	}

	public void create_menu_system() {
		menu_system = new Gtk.Menu();
		var menu_about = new ImageMenuItem.from_stock(Stock.ABOUT, null);
		menu_about.activate.connect(about_clicked);
		menu_system.append(menu_about);

		var menu_quit = new ImageMenuItem.from_stock(Stock.QUIT, null);
		menu_quit.activate.connect(Gtk.main_quit);
		menu_system.append(menu_quit);
		menu_system.show_all();
	}

	private void menu_system_popup(uint button, uint time) {
		menu_system.popup(null, null, null, button, time);
	}

	private void about_clicked() {
		var about = new Gtk.AboutDialog();
		about.set_version("0.0.0");
		about.set_program_name("Tray");
		about.set_comments("Tray Utility");
		about.set_copyright("vala");
		about.run();
		about.hide();
	}


	public static int main(string[] args) {
		Gtk.init (ref args);

		var App = new AppStatusIcon();
		App.hide();
		Gtk.main();
		return 0;
	}
}
