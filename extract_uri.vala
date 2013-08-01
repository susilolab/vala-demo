// valac --pkg libesmtp email.vala

public class SendEmail: GLib.Object
{
	public SendEmail() {
	}

	public void run() {
		string uri_list = """#comment
		http://localhost/valadoc/glib-2.0/GLib.Uri.list_extract_uris1.html
		http://localhost/valadoc/glib-2.0/GLib.Uri.list_extract_uris2.html
		http://localhost/valadoc/glib-2.0/GLib.Uri.list_extract_uris3.html
		""";

		string[] uris = Uri.list_extract_uris(uri_list);
		foreach(string uri in uris) {
			stdout.printf("Uri: %s\n", uri);
		}
	}

	static int main() {
		SendEmail app = new SendEmail();
		app.run();

		return 0;
	}
}
