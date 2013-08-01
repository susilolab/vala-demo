// valac --pkg glib-2.0 --pkg gio-2.0 backup_data.vala -o backup_data
class BackupData: GLib.Object
{
	private string[] account = {"ecc_promo", "ovy_sary"};
	private string[] old_file;
	private string[] new_file;
	// public const LOG_PATH "/";

	public BackupData() {
		this.readFolder(".");
/*
		foreach(string x in this.new_file) {
			stdout.printf("%s\n", x);
		} */
	}

	public void backupChat() {
	}

	public void readFolder(string sPath) {
		try {
			var directory = File.new_for_path(sPath);
			var enumerator = directory.enumerate_children(FileAttribute.STANDARD_NAME, 0);

			FileInfo file_info;
			GLib.TimeVal mod_time;
			string current_path = "";
			string fname = "";
			while((file_info = enumerator.next_file()) != null) {
				//stdout.printf("%s\n", file_info.get_name());
				this.new_file += file_info.get_name();

				fname = file_info.get_name();
				current_path = Environment.get_current_dir();
				var fl = File.new_for_path(current_path + @"/$fname");

				var info = fl.query_info (FileAttribute.TIME_MODIFIED, FileQueryInfoFlags.NONE, null);
				mod_time = info.get_modification_time();
				this.getDate(mod_time);

				// stdout.printf ("Modification Time: %ld\n", mod_time.tv_sec);
				stdout.printf (@"$fname, Modification Time: %s\n", mod_time.to_iso8601());
			}

		}catch(Error e) {
			stdout.printf("%s\n", e.message);
		}
	}

	public void getDate(TimeVal tv) {
		DateTime dt = new DateTime.from_timeval_local(tv);
		int d, m, y;
		d = dt.get_day_of_month();
		m = dt.get_month();
		y = dt.get_year();
		stdout.printf(@"Tanggal: $d, Bulan: $m, Tahun: $y\n");
	}

	//public string[] compareArray() {
	//}

	static int main (string[] args) {
		var run = new BackupData();
		var dir = "/home/susilo";
		if(args.length > 1) {
			dir = args[1];
		}

		// run.readFolder(dir);

		return 0;
	}
}
