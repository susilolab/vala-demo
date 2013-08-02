using Gtk;

class AlignmentSample: Window
{ 
	public AlignmentSample() {
		this.title           = "Alignment Layout sample";
	    this.border_width    = 5;
	    this.window_position = WindowPosition.CENTER;
	    this.set_default_size(350, 200);
	    this.destroy.connect(Gtk.main_quit);

		var vbox   = new VBox(false, 5);
		
		// xscale, yscale, xalign, yalign
		var valign = new Alignment(0, 1, 0, 0);
		vbox.add(valign);
		add(vbox);
		
		var hbox = new HBox(true, 3);
		
		var ok_button = new Button.with_label("OK");
		ok_button.set_size_request(70, 30);
		hbox.add(ok_button);
		
		var close_button = new Button.with_label("Close");
		hbox.add(close_button);
		
		var halign = new Alignment(1, 0, 0, 0);
		halign.add(hbox);
		
		vbox.pack_start(halign, false, false, 0);
	}
	
	static int main (string[] args) {
	    Gtk.init(ref args);
	 
	    var window = new AlignmentSample();
	    window.show_all();
	 
	    Gtk.main();
	    return 0;
	}
}
