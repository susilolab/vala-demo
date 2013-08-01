[DBus (name = "org.example.Demo")]
public class DemoServer: Object
{
	public int ping(string msg, int i) {
		stdout.printf("%s [%d]\n", msg, i);
		return i+1;
	}
}

void on_bus_aquired(DBusConnection conn) {
	try {
		conn.register_object("/org/example/demo",
			new DemoServer());
	}catch(IOError e) {
		stderr.printf("Could not register service\n");
	}
}

void main() {
	Bus.own_name(
		BusType.SESSION,
		"org.example.Demo",
		BusNameOwnerFLags.NONE,
		on_bus_aquired,
		() => {},
		() => stderr.printf("Could not aquire name\n")
	);

	new MainLoop().run();
}