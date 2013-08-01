using Notify;

public class HelloWorld
{
	static void main() {
		Notify.init("Hello World");
		var Hello = new Notification("Hello!", "This is example", "dialog-information");
		Hello.show();
	}
}