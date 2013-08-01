using GLib;
using Sqlite;

public class SqliteSample: GLib.Object
{
	public static int main(string[] args) {
		Database db;
		Statement stmt;
		int rc = 0;
		int col, cols;

		if(args.length !=3) {
			stderr.printf("Usage: %s DATABASE SQL-STATEMENT\n", args[0]);
		}
	}
}