// vala --pkg sqlite3 sqlite_conn.vala
public class DemoSqlite: GLib.Object
{
	private Sqlite.Database db;
	construct {
		this.create_tables();
	}

	private int create_tables() {
		int rc = 0;
		rc = Sqlite.Database.open(Environment.get_home_dir() + "/.local/share/adzan-alarm/settings.db",
			out this.db);

		if(rc != Sqlite.OK) {
			stdout.printf("%s\n", this.db.errmsg());
		}
		return rc;
	}

	static int main() {
		var app = new DemoSqlite();
		return 0;
	}
}