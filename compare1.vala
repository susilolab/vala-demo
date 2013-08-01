public class DemoCompare: Object
{
	public bool isRun = false;
	public DemoCompare() {
		stdout.printf("isRun: false\n");
	}

	private void run() {
		isRun = true;
		stdout.printf("isRun: %s\n", isRun.to_string());
	}

	static int main (string[] args) {
		var app = new DemoCompare();
		app.run();

	    return 0;
	}
}