[DBus (name = "org.example.Demo")]
interface DemoClient: Object
{
	public abstract int ping(string msg, int i) {
		throws IOError;
	}
}

void main() {
	int i = 1;
	int j;
	while(true) {
		try {
			DemoClient client = Bus.get_proxy_sync(
				BusType.SESSION,
				"org.example.Demo",
				"/org/example/demo");

			j = client.ping("ping", i);
			stdout.printf("%d => %d\n", i, j);
			i = j;

		}catch(IOError e) {
			stderr.printf("%s\n", e.message);
		}
		Thread.usleep(1000000);
	}
}