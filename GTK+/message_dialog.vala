// valac --pkg gtk+-3.0 helo.vala
using Gtk;

class AboutDialogSample: Window
{
	public string[] artists;
	
	public AboutDialogSample() {
		this.title           = "Contoh About Dialog vala";
	    this.border_width    = 1;
	    this.window_position = WindowPosition.CENTER;
	    this.set_default_size(350, 70);
	    this.destroy.connect(Gtk.main_quit);
	
		var dialog_btn = new Button.with_label("Message dialog");
		dialog_btn.clicked.connect(show_dialog);
		
		var about_dialog_btn = new Button.with_label("About dialog");
		about_dialog_btn.clicked.connect(show_about_dialog);
		
		var hbox = new Box(Orientation.HORIZONTAL, 5);
		hbox.homogeneous = true;
		hbox.add(dialog_btn);
		hbox.add(about_dialog_btn);
		add(hbox);
	}
	
	private void show_dialog() {
		var dialog = new MessageDialog(null, DialogFlags.MODAL, MessageType.INFO, ButtonsType.OK, 
			"Hello from Vala!");
			
		dialog.set_title("Message Dialog");
		dialog.run();
		dialog.destroy();
	}
	
	public void show_about_dialog() {
		artists = {"Agus"};
		var about_dialog = new AboutDialog();
		about_dialog.artists = artists;
		//dialog.run();
		//dialog.hide();
	}
	
	static int main (string[] args) {
	    Gtk.init(ref args);
	 
	    var window = new AboutDialogSample();
	    window.show_all();
	 
	    Gtk.main();
	    return 0;
	}
}
