// valac --pkg gio-2.0 net_monitor.vala

public class NetMonitor: GLib.Object
{
	public NetMonitor() {
	}

	public void run() {
		NetworkMonitor mon = NetworkMonitor.get_default();
		bool avail = mon.get_network_available();
		stdout.printf("Network available: %s\n", avail.to_string());

		NetworkAddress address = new NetworkAddress("www.tukangkoding.com", 80);
		if(avail == true) {
			try {
				bool can_reach = mon.can_reach(address);
				stdout.printf("Can reach: %s\n", can_reach.to_string());

			}catch(Error e) {
				stdout.printf("Error: %s\n", e.message);
			}
		}

		mon.network_changed.connect( (avail) => {
			stdout.printf("Network changed(available: %s)\n", avail.to_string());
			if(avail == true) {
				mon.can_reach_async.begin(address, null, (obj, res) => {
					try {
						bool can_reach = mon.can_reach_async.end(res);
						stdout.printf("Can reach: %s\n", can_reach.to_string());
					}catch(Error e) {
						stdout.printf("Error: %s\n", e.message);
					}
				});
			}
		});

		new MainLoop().run();
	}

	static int main() {
		NetMonitor app = new NetMonitor();
		app.run();

		return 0;
	}
}
