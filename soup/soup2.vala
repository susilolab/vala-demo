// valac --pkg libsoup-2.4 soup2.vala
using Soup;

public class ForSample : Object
{
	public ForSample() {
	}

	public void run(string username="susil0") {
		string url = "http://ecc.swevel.com/esmsgis";
		stdout.printf("Getting data from %s", url);

		var session = new Soup.SessionAsync();
		var message = new Soup.Message("GET", url);
		message.finished.connect( () => {
			stdout.printf("Finished processing.\n");
		});

		session.send_message(message);
		stdout.write(message.response_body.data);
	}

	public static int main(string[] args) {
		var app = new ForSample();
		app.run();

    	return 0;
    }
}
