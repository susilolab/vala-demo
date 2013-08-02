/**
 * Menstyle aplikasi GTK dengan StyleContext dan CssProvider
 */

using Gtk;

class StyleApp1 : Window
{
	public StyleApp1() {
		this.title = "Style app example";
		this.border_width = 10;
		this.window_position = WindowPosition.CENTER;
		this.set_default_size (350,70);
		this.destroy.connect(Gtk.main_quit);
		
		var style_context = this.get_style_context();
		var css_provider = new CssProvider();
		string style = "styleapp1.css";
		css_provider.load_from_path(style);
		style_context.add_provider(css_provider, STYLE_PROVIDER_PRIORITY_USER);
	}
	
	static int main(string[] args) {
		Gtk.init(ref args);
		
		var win = new StyleApp1();
		win.show_all();
		
		Gtk.main();
    	return 0;
	}
}
