public class HangMan: Object
{
	public string[] kata = {
		"Yamaha",
		"Honda",
		"Suzuki"
	};

	public HangMan() {
	}

	private void run() {
		stdout.printf("%s\n", kata[0]);
	}

	static int main() {
		var app = new HangMan();
		app.run();

		return 0;
	}
}
