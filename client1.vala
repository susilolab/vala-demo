void main() {
	var host = "www.google.com";
	try {

		var resolver  = Resolver.get_default();
		var addresses = resolver.lookup_by_name(host, null);
		var address   = addresses.nth_data(0);
		print(@"Resolved $host to $address\n");

		var client = new SocketClient();
		var conn = client.connect(new InetSocketAddress(address, 80));
		print(@"Connected to $host\n");

		var message = @"GET / HTTP/1.1\r\nHost: $host\r\n\r\n";
		conn.output_stream.write(message.data);
		print("Wrote request\n");

		var response = new DataInputStream(conn.input_stream);
		var status_line = response.read_line(null).strip();
		print("Received status line: %s\n", status_line);

	}catch(Error e) {
		stderr.printf("%s\n", e.message);
	}
}
