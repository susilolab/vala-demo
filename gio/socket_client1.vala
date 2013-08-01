// valac --pkg gio-2.0 socket_client1.vala

public class NetMonitor: GLib.Object
{
	public NetMonitor() {
		this.ping();

		new MainLoop().run();
	}

	public void ping() {
		SocketClient sc = new SocketClient();
		sc.family = SocketFamily.IPV4;
		sc.type = SocketType.STREAM; // SEQPACKET
		sc.protocol = SocketProtocol.TCP;

		try {
			SocketConnection conn = sc.connect_to_host("www.google.com", 80, null);
			if(conn.is_connected()) {
				Socket sock = conn.get_socket();
				uint timeout = sc.get_timeout();
				stdout.printf("TTL: %ld\n", sock.ttl);
			}

		}catch(Error e) {
			stdout.printf("Error: %s\n", e.message);
		}
	}

	static int main() {
		NetMonitor app = new NetMonitor();

		return 0;
	}
}
