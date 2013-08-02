using Gtk;

class BoxSample: Window
{ 
	public BoxSample() {
		this.title           = "Box Layout sample";
	    this.border_width    = 1;
	    this.window_position = WindowPosition.CENTER;
	    this.set_default_size(400, 300);
	    this.destroy.connect(Gtk.main_quit);
	
		var vbox = new VBox(true, 2);
		var settings = new Button.with_label("Settings");
		var accounts = new Button.with_label("Accounts");
		var loans = new Button.with_label("Loans");
		var cash = new Button.with_label("Cash");
		var debts = new Button.with_label("Debts");
		
		vbox.pack_start(settings, true, true, 0);
		vbox.pack_start(accounts, true, true, 0);
		vbox.pack_start(loans, true, true, 0);
		vbox.pack_start(cash, true, true, 0);
		vbox.pack_start(debts, true, true, 0);
		add(vbox);
	}
	
	static int main (string[] args) {
	    Gtk.init(ref args);
	 
	    var window = new BoxSample();
	    window.show_all();
	 
	    Gtk.main();
	    return 0;
	}
}
