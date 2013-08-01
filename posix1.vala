class DemoPosix1: Object
{
	public DemoPosix1() {
	}

	public void run() {
		string nama = "Agus123";
		stdout.printf("%s\n", is_alnum(nama).to_string());
	}

	public bool is_alnum(string str) {
		bool result = true;
		for(int i=0; i<str.length; i++) {
			if(Posix.isalnum(str[i]))
				result &= true;
			else
				result &= false;
		}
		return result;
	}

	public static void main() {
		var app = new DemoPosix1();
		app.run();
	}
}
