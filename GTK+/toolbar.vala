using Gtk;

public class TextFileViewer: Window {
	private TextView text_view;
	public TextFileViewer() {
		this.title = "Text File Viewer";
		this.window_position = WindowPosition.CENTER;
		set_default_size(400, 300);
		
		var toolbar= new Toolbar();
		toolbar.get_style_context().add_class(STYLE_CLASS_PRIMARY_TOOLBAR);
		
		var open_button= new ToolButton.from_stock(Stock.OPEN);
		open_button.is_important = true;
		toolbar.add(open_button);
		open_button.clicked.connect(on_open_clicked);
		
		this.text_view = new TextView();
		this.text_view.editable = false;
		this.text_view.cursor_visible = false;
		
		var scroll = new ScrolledWindow(null, null);
		scroll.set_policy(PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
		scroll.add(this.text_view);
		
		var vbox = new Box(Orientation.VERTICAL, 0);
		vbox.pack_start(toolbar, false, true, 0);
		vbox.pack_start(scroll, true, true, 0);
		add(vbox);
	}
	
	private void on_open_clicked() {
		var file_chooser = new FileChooserDialog("Open File", this,
			FileChooserAction.OPEN, Stock.CANCEL, ResponseType.CANCEL,
			Stock.OPEN, ResponseType.ACCEPT);
			
		if(file_chooser.run() == ResponseType.ACCEPT) {
			open_file(file_chooser.get_filename());
		}
		file_chooser.destroy();
	}
	
	private void open_file(string filename) {
		try{
			string text;
			FileUtils.get_contents(filename, out text);
			this.text_view.buffer.text = text;
			
		}catch(Error e) {
			stderr.printf("Error: %s\n", e.message);
		}
	}
	
	public static int main(string[] args) {
		Gtk.init(ref args);
		
		var window= new TextFileViewer();
		window.destroy.connect(Gtk.main_quit);
		window.show_all();
		
		Gtk.main();
		return 0;
	}
}
