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

	stdout.printf("Client info: %s\n", Mysql.get_client_info());
	stdout.printf("Host info: %s\n", mysql.get_host_info());
	stdout.printf("Info: %s\n", mysql.info());

	string sql = "SELECT * FROM user LIMIT 10";
	rc = mysql.query(sql);
	if(rc !=0) {
		stdout.printf("ERROR %u: Query failed: %s\n", mysql.errno(), mysql.error());
		return rc;
	}

	Result ResultSet = mysql.use_result();
	stdout.printf("Info: %s\n", mysql.info());
	string[] MyRow;
	while( (MyRow = ResultSet.fetch_row()) != null) {
		stdout.printf("id: %s, nama_user: %s\n", MyRow[0], MyRow[1]);
	}

	return rc;
}