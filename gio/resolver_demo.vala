// valac --pkg gio-2.0 resolver_demo.vala
public class ResolverDemo: GLib.Object
{
	public ResolverDemo() {
		try {
			Resolver resolver = Resolver.get_default();
			List<InetAddress> addresses = resolver.lookup_by_name("www.google.com", null);

			foreach(InetAddress address in addresses) {
				stdout.printf("%s\n", address.to_string());
			}

		}catch(Error e) {
			stdout.printf("%s\n", e.message);
		}
	}

	static int main() {
		var app = new ResolverDemo();
		return 0;
	}
}
