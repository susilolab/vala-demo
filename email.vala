// valac --pkg libesmtp email.vala
using Smtp;

public class SendEmail: GLib.Object
{
	public Session sess;
	public Message msg;

	public SendEmail() {
	}

	public void run() {
		sess.set_server("smtp.gmail.com:465");
	}

	static int main() {
		SendEmail app = new SendEmail();
		app.run();

		return 0;
	}
}
