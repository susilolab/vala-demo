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

	Result ResultSet = mysql.list_processes();
	string[] row;

	while( (row = ResultSet.fetch_row()) != null) {
		stdout.printf("PID: %s\t", row[0]);
		stdout.printf("Owner: %s\t", row[1]);
		stdout.printf("Host: %s\t", row[2]);
		stdout.printf("DB: %s\n", row[3]);
	}
	stdout.printf("Jumlah process: %u\n", ResultSet.num_rows());

	return rc;
}