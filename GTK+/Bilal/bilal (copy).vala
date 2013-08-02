// valac --pkg gtk+-3.0 helo.vala
using Gtk;

class Bilal: Window
{ 
	public Bilal() {
		this.title           = "Bilal";
		// , Pengingat Adzan dan Waktu Sholat
	    this.border_width    = 1;
	    this.window_position = WindowPosition.CENTER;
	    this.set_default_size(400, 300);
	    this.destroy.connect(Gtk.main_quit);
	
		var image = new Image.from_file("leftbar_image.png");
		var play_adzan_button = new Button.with_label("Play");
		
		var hbox = new Box(Orientation.HORIZONTAL, 0);
		hbox.homogeneous = true;
		hbox.add(image);
		
		var vbox = new 
		hbox.add(play_adzan_button);
		add(hbox);
	}
	
	static int main (string[] args) {
	    Gtk.init(ref args);
	 
	    var window = new Bilal();
	    window.show_all();
	 
	    Gtk.main();
	    return 0;
	}
}
