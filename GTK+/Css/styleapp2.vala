/**
 * Menstyle aplikasi GTK dengan StyleContext dan CssProvider
 */

using Gtk;
using Gdk;

class StyleApp2 : Gtk.Window
{
	public StyleApp2() {
		this.title = "Style app example";
		this.border_width = 10;
		this.window_position = WindowPosition.CENTER;
		this.set_default_size (350,70);
		this.destroy.connect(Gtk.main_quit);
		

		var screen = Gdk.Screen.get_default();
		
		var css_provider = new CssProvider();
		string style = "styleapp2.css";
		css_provider.load_from_path(style);

		var style_context = this.get_style_context();		
		style_context.add_provider_for_screen(screen, css_provider, STYLE_PROVIDER_PRIORITY_USER);
		
		var vbox = new VBox(false, 0);		
		var button = new Button.with_label("Go next");
		vbox.pack_start(button, false, false);
		add(vbox);
	}
	
	static int main(string[] args) {
		Gtk.init(ref args);
		
		var win = new StyleApp2();
		win.show_all();
		
		Gtk.main();
    	return 0;
	}
}
