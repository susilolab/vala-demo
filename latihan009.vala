/**
 * latihan006.vala
 * 2012-09-22 23:20
 * Spawning processes
 */
using Mysql;

void main () {
	int year = 2012;
	int month = 9;
	int day = 30;
	int hour = 23;
	int minute = 26;
	double second = 10;
	var date1 = new DateTime.now_local();
	var date2 = new DateTime.local(year, month, day, hour, minute, second);
	
	stdout.printf(date1.to_string() + "\n");
	stdout.printf(date2.to_string() + "\n");
}
