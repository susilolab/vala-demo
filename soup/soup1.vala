// valac --pkg libsoup-2.4 soup1.vala
using Soup;

public class ForSample : Object
{
	public ForSample() {
	}

	public void run(string username="susil0") {
		string url = "http://twitter.com/users/%s.xml".printf(username);
		stdout.printf("Getting status for %s\n".printf(username));

		var session = new Soup.SessionAsync();
		var message = new Soup.Message("GET", url);

		session.send_message(message);
		stdout.write(message.response_body.data);
	}

	public static int main(string[] args) {
		var app = new ForSample();
		app.run(args[1]);

    	return 0;
    }
}
