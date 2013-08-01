class DemoStack: Object
{
	public DemoStack() {
	}

	public void run() {
		Regex regex = new GLib.Regex("vita");
		string nama = "Vita";
		stdout.printf("%g", regex.match(nama));
	}

	static void main () {
		var app = new DemoStack();
		app.run();

		stdout.printf("\n");
	}
}