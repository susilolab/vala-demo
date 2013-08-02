/**
 * Set icon to application
 * @created 5 Agustus 2012, 22:16
 */

using Gtk;

public class AdzanAlarm: Window {
	public AdzanAlarm() {
		this.title = "Adzan Alarm";
		this.window_position = WindowPosition.CENTER;
		this.border_width = 2;
		set_default_size(600, 500);

		//var table = new Grid();
		var grid = new Grid();
		var lbl_shubuh = new Label("Shubuh");
		var button1 = new Button.with_label("Button 1");
		var button2 = new Button.with_label("Button 2");
		var button3 = new Button.with_label("Button 3");
		var button4 = new Button.with_label("Button 4");
		var button5 = new Button.with_label("Button 5");
		var button6 = new Button.with_label("Button 6");

        grid.add(button1);
        grid.attach(button2, 1, 0, 2, 1);
        grid.attach_next_to(button3, button1, Gtk.PositionType.BOTTOM, 1, 2);
        grid.attach_next_to(button4, button3, Gtk.PositionType.RIGHT, 2, 1);
        grid.attach(button5, 1, 2, 1, 1);
        grid.attach_next_to(button6, button5, Gtk.PositionType.RIGHT, 1, 1);
        add(grid);

/*
		table.attach(lbl_shubuh, 0, 1, 0, 1, AttachOptions.EXPAND, AttachOptions.SHRINK, 0, 0);
		table.set_row_spacings(1);
		table.set_col_spacings(1);
		add(table);

		try {
			window.icon = new Gdk.Pixbuf.from_file("basic.png");
			window.icon = IconTheme.get_default().load_icon("basic", 48, 0);

		}catch(Error e) {
			stderr.printf("Could not load application icon: %s", e.message);
		}*/
	}

	public static int main(string[] args) {
		Gtk.init(ref args);

		var window = new AdzanAlarm();
		window.destroy.connect(Gtk.main_quit);
		var menu = new GLib.Menu();
		menu.append("About", "win.about");
		menu.append("Quit", "win.quit");
		window.Application.app_menu = menu;

		VariantType? vp;
		var quit_action = new GLib.SimpleAction("quit", vp);
		quit_action.active.connect(this.quit);
		window.add_action(quit_action);

		window.show_all();

		Gtk.main();
		return 0;
	}
}
