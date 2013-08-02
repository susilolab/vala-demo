using Granite.Widgets;

public class Granite.Demo : Granite.Application
{
	construct
	{
		application_id = "demo.granite.org";
        program_name = "Granite Demo";
        app_years = "2011";

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
        about_artists = {"Daniel P. Fore",
                         null
                         };

        about_authors = {"Maxwell Barvian <mbarvian@gmail.com>",
                         "Daniel Foré <bunny@go-docky.com>",
                         "Avi Romanoff <aviromanoff@gmail.com>",
                         null
                         };

        about_comments = "A demo of the Granite toolkit";
        about_translators = "Launchpad Translators";
        about_license_type = Gtk.License.GPL_3_0;
	}
	
	public class Demo() {
	}
	
	public override void activate() {
		var win = new Gtk.Window();
		win.window_position = Gtk.WindowPosition.CENTER_ALWAYS;
		
		win.delete_event.connect( () => {
			Gtk.main_quit();
			return false;
		});
		
		var notebook = new Gtk.Notebook();
		win.add(notebook);
		
		var welcome = new Welcome("Granite's Welcome Screen", "This is Granite's Welcome widget.");
		notebook.append_page(welcome, new Gtk.Label("Welcome"));
		
		win.show_all();
		win.resize(400, 300);
	}
	
	public static int main(string[] args) {
		new Granite.Demo().run(args);
		Gtk.main();
		return 0;
	}
}
