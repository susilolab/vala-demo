using Mysql;

namespace LibDatabase
{
	public class KannelDb: Object
	{
		public ClientFlag cflag = 0;
		public string     db_host = "127.0.0.1";
		public string     db_user = "agus";
		public string     db_pwd = "qwerty";
		public string     db_dbname = "ecc2_swevel";
		public int        db_port= 3306;
		public string     db_socket= null;
		public Database mysql;
		private bool _isConnected = false;

		public KannelDb() {
			init();
		}

		public void init() {
			this.mysql = new Mysql.Database();
			this._isConnected = this.mysql.real_connect(this.db_host, this.db_user, this.db_pwd, this.db_dbname,
				this.db_port, this.db_socket, this.cflag);
		}

		public string[,] queryAll(string sql) {
			int rc = 0;
			if(!this._isConnected) {
				rc= 1;
				stdout.printf("%u, %s", this.mysql.errno(), this.mysql.error());
			}

			rc = this.mysql.query(sql);
			if(rc !=0) {
				stdout.printf("ERROR %u: Query failed: %s\n", this.mysql.errno(), this.mysql.error());
			}

			Result ResultSet = this.mysql.use_result();
			uint num_fields = ResultSet.num_fields;
			uint num_rows = ResultSet.num_rows;

			string[,] rows = new string[num_rows, num_fields];
			rows = ResultSet.fetch_row();
			/* while( (rows = ResultSet.fetch_row()) != null) {
				stdout.printf("id: %s, nama_user: %s\n", MyRow[0], MyRow[1]);
			} */

			return rows;
		}

		public void queryRow() {
		}

		public void queryScalar() {
		}
	}
}
