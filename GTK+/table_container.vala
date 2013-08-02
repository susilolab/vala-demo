using Gtk;

class TableSample: Window
{ 
	private Button* button;
	
	public TableSample() {
		this.title           = "Table Layout sample";
	    this.border_width    = 5;
	    this.window_position = WindowPosition.CENTER;
	    this.set_default_size(250, 180);
	    this.destroy.connect(Gtk.main_quit);
		
		string[16] values = {
			"7", "8", "9", "/",
			"4", "5", "6", "7",
			"1", "2", "3", "-",
			"0", ".", "=", "+"
		};
		
		var table = new Table(4, 4, true);
		table.set_col_spacings(2);
		table.set_row_spacings(2);
		
		int i = 0;
		int j = 0;
		int pos = 0;
		
		for(i=0; i<4; i++) {
			for(j=0; j<4; j++) {
				button = new Button.with_label(values[pos]);
				table.attach_defaults(button, j, j+1, i, i+1);
				pos++;
			}
		}
		
		add(table);
	}
	
	static int main (string[] args) {
	    Gtk.init(ref args);
	 
	    var window = new TableSample();
	    window.show_all();
	 
	    Gtk.main();
	    return 0;
	}
}
