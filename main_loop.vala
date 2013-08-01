using GLib;

class Kelas: Object
{
	public Kelas() {
	}

	public void run() {
		MainLoop loop = new MainLoop();
		// TimeoutSource time = new TimeoutSource(2000); // miliseconds
		TimeoutSource time = new TimeoutSource.seconds(5); // miliseconds

		time.set_callback( () => {
			stdout.printf("Time!\n");
			loop.quit();
			return false;
		});
		time.attach(loop.get_context());
		loop.run();
	}

	static int main() {
		Kelas app = new Kelas();
		app.run();

		return 0;
	}
}
