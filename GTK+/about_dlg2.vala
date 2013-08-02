/**
 * Komentar program
 */
using Gtk;
public static void button_toggled(ToggleButton own, ToggleButton other) {
	other.set_sensitive(!own.get_active());
}

public class AboutDialogDua: Gtk.Application
{
	const string COMMENTS = "Contoh about dialog dengan vala.";
	public AboutDialogDua() {
		Object(application_id: "app.demo.dialog",
			flags: ApplicationFlags.FLAGS_NONE);
	}

	static int main (string[] args) {
		Gtk.init(ref args);

		var window = new Window ();
		window.title = "About Dialog";
		window.window_position = WindowPosition.CENTER;
		window.set_default_size (200,50);
		window.destroy.connect(Gtk.main_quit);

		var button = new Button.with_label("Tentang Saya");

		var dlg = new AboutDialog();
		dlg.set_destroy_with_parent(true);
		dlg.set_transient_for(window);
		dlg.set_modal(true);

		dlg.artists = { "Jackie Chan", "Jet Lee" };
		dlg.authors = { "Agus Susilo", "Novi Permata Sari" };
		dlg.program_name = window.title;
		dlg.comments = COMMENTS;
		dlg.license = "Program ini 100% gratis, tanpa dipungut biaya.";
		dlg.website = "http://www.tukangkoding.com";
		dlg.website_label = "Tukang Koding";
		// dlg.license_type = License.GPL_3_0;

		dlg.response.connect ((response_id) => {
			if (response_id == Gtk.ResponseType.CANCEL || response_id == Gtk.ResponseType.DELETE_EVENT) {
				dlg.hide_on_delete();
			}
		});

		dlg.close.connect (() => { dlg.hide_on_delete(); });
		button.margin = 10;
		button.clicked.connect( () => {
			dlg.run();
		});
		window.add(button);
		window.show_all();

		Gtk.main();
	    return 0;
	}
}
