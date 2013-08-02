//valac -o kannel-client --pkg gtk+-3.0 --pkg mysql kannel-client.vala LibDatabase.vala -X -lmysqlclient
using Gtk;
using LibDatabase;

public class KannelClient: Window
{
	private Builder builder;
	private Window main_window;
	private ComboBoxText cbtext;
	private ComboBox cb;
	private ListStore lst;

	public KannelClient() {
		init();
	}

	public void init() {
		try {
			builder = new Builder();
			builder.add_from_file("login.glade");
			builder.connect_signals(null);
			this.main_window = builder.get_object("window1") as Window;
			this.main_window.destroy.connect(Gtk.main_quit);
			this.main_window.title = "Kannel Client Login";
			this.main_window.show_all();
			builder.connect_signals(this);

		}catch(Error e) {
			stderr.printf("%s\n", e.message);
		}
	}

	public static int main(string[] args) {
		Gtk.init(ref args);

		var app = new KannelClient();
		var db = new KannelDb();
		string sql = "SELECT * FROM user LIMIT 5";
		string[,] hasil = db.queryAll(sql);
		for(int i=0; i<hasil[0].length; i++) {
				stdout.printf("%s\n", hasil[0][i]);
		}

		Gtk.main();
		return 0;
	}
}
