// valac --pkg sqlheavy-0.1 sqlheavy1.vala
using SQLHeavy;

int main(string[] args) {
	Database db;
	HashTable<string, SQLHeavy.Table> hash_table;

	try {
		db = new SQLHeavy.Database("testdb.db", FileMode.READ | FileMode.WRITE | FileMode.CREATE);
		SQLHeavy.Query query = db.prepare("CREATE TABLE tbl(id DOUBLE, nama TEXT)");
		query.execute();

	}catch(SQLHeavy.Error e) {
		stdout.printf("Error: %s", e.message);
	}

	stdout.printf("\n");
	return 0;
}
