// valac --pkg libesmtp email.vala

public class SendEmail: GLib.Object
{
	public SendEmail() {
	}

	public void run() {
		stdout.printf("%c\n", Path.DIR_SEPARATOR);
		stdout.printf("%s\n", Path.DIR_SEPARATOR_S);
		stdout.printf("%c\n", Path.SEARCHPATH_SEPARATOR);
		stdout.printf("%s\n", Path.SEARCHPATH_SEPARATOR_S);
	}

	static int main() {
		SendEmail app = new SendEmail();
		app.run();

		return 0;
	}
}
