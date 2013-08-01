// kompile dengan:
// valac -o koneksi koneksi.vala --pkg mysql -X -lmysqlclient

using Mysql;

int main (string[] args) {
	int rc = 0;
	ClientFlag cflag=0;
	string     host="127.0.0.1";
	string     user="user";
	string     pwd="password";
	string     database="demo";
	int        port= 3306;
	string     socket= null;

	Database mysql = new Mysql.Database();
	var isConnected = mysql.real_connect(host, user, pwd, database, port, socket, cflag);
	if(!isConnected) {
		rc= 1;
		stdout.printf("%u, %s", mysql.errno(), mysql.error());
	}
	stdout.printf("Connected to mysql version: %s (%lu)\n",
		mysql.get_server_info(), (ulong)mysql.get_server_version());

	string sql = "SELECT * FROM swt_users LIMIT 10";
	rc = mysql.query(sql);
	if(rc !=0) {
		stdout.printf("ERROR %u: Query failed: %s\n", mysql.errno(), mysql.error());
		return rc;
	}

	Result ResultSet = mysql.use_result();

	Field[] fields = ResultSet.fetch_fields();
	for(int i=0; i< fields.length; i++) {
		stdout.printf("%s", fields[i].name);
		if(i < (fields.length-1))
			stdout.printf(", ");
	}
	stdout.printf("\n");

	stdout.printf("Jumlah kolom: %u\n", ResultSet.num_fields());
	return rc;
}