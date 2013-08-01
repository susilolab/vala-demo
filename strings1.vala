class DemoString: GLib.Object
{
	public DemoString() {
	}

	public void run() {
		string demo = """ini adalah verbatim text 'ok""";
		string nama = "Agus";
		stdout.printf(@"Panjang '$nama': %d\n", nama.length);
		stdout.printf(@"$nama: %u\n", nama.data);
		stdout.printf("%s\n", demo);

		string[] name = {"agus", "vita" };
		string list_name = "";
		stdout.printf("list_name: %s\n", list_name.joinv(",", name));

		stdout.printf("nama: %s\n", nama);
		stdout.printf("nama.up(): %s\n", nama.up());
		stdout.printf("nama.index_of('A'): %d\n", nama.index_of("A"));

		string acl = "read,write,delete";
		stdout.printf("acl: %s\n", acl);
		stdout.printf("acl.split(\",\"): \n");
		string[] acls = acl.split(",");
		foreach (string perm in acls) {
			stdout.printf("%s\n", perm);
		}
	}

	static int main() {
		var app = new DemoString();
		app.run();

		return 0;
	}
}