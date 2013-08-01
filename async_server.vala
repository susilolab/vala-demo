bool on_incoming_connection(SocketConnection conn) {
	stdout.printf("Ada koneksi\n");
	process_request.begin(conn);
	return true;
}

async void process_request(SocketConnection conn) {
	try {
		var dis = new DataInputStream(conn.input_stream);
		var dos = new DataOutputStream(conn.output_stream);
		string req = yield dis.read_line_async(Priority.HIGH_IDLE);
		dos.put_string("Got: %s\n".printf(req));

	}catch(Error e) {
		stderr.printf("%s\n", e.message);
	}
}

void main() {
	try {
		var srv = new SocketService();
		srv.add_inet_port(3333, null);
		srv.incoming.connect(on_incoming_connection);
		srv.start();
		new MainLoop().run();
		
	}catch(Error e) {
		stderr.printf("%s\n", e.message);
	}
}