// valac --pkg gtk+-3.0 --pkg granite granite_sample3.vala
using Granite.Widgets;

public class GraniteDemo : Granite.Application
{
	construct
	{
		application_id = "demo.granite.org";
        program_name = "About Dialog Demo";
        app_years = "2012";

        build_version = "1.0";
        app_icon = "text-editor";
        main_url = "https://launchpad.net/granite";
        bug_url = "https://bugs.launchpad.net/granite";
        help_url = "https://answers.launchpad.net/granite";
        translate_url = "https://translations.launchpad.net/granite";
        about_authors = {"Kekun",
                         null
                         };
        about_documenters = {"Valadoc",
                             null
                             };
        about_artists = {"Agus susilo",
                         null
                         };

        about_authors = {
        	"Agus Susilo <smartgdi@gmail.com>",
            "Novi Permatasari <novitasari@gmail.com>",
			null
		};

        about_comments = "A demo of the Granite toolkit";
        about_translators = "Launchpad Translators";
        about_license_type = Gtk.License.GPL_3_0;
	}
	
	public class GraniteDemo() {
	}
	
	public override void activate() {
		var win = new Gtk.Window();
		win.title = "About Dialog Demo";
		win.window_position = Gtk.WindowPosition.CENTER;
		
		win.delete_event.connect( () => {
			Gtk.main_quit();
			return false;
		});
		
		var button_about = new Gtk.Button.with_label("About dialog");
		button_about.clicked.connect( () => { show_about(win); } );
		win.add(button_about);
		
		win.show_all();
		win.resize(200, 150);
	}
	
	public static int main(string[] args) {
		new GraniteDemo().run(args);
		Gtk.main();
		return 0;
	}
}
