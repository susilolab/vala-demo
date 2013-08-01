// valac --pkg libesmtp email.vala

public class SendEmail: GLib.Object
{
	public SendEmail() {
	}

	public void run() {
		try {
			Process.spawn_command_line_async("ping www.aqwe.com");

		}catch(SpawnError e) {
			stdout.printf("Error: %s\n", e.message);
		}
	}

	static int main() {
		SendEmail app = new SendEmail();
		app.run();

		return 0;
	}
}
