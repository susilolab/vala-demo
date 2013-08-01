// valac --pkg gio-2.0 filemon_demo.vala
public class FileMonDemo: GLib.Object
{
	public FileMonDemo() {
		try {
			File file = File.new_for_path(Environment.get_home_dir());
			FileMonitor monitor = file.monitor(FileMonitorFlags.NONE, null);
			stdout.printf("Monitor: %s\n", file.get_path());

			monitor.changed.connect( (src, dest, event) => {
				if (dest != null) {
					stdout.printf ("%s: %s, %s\n", event.to_string (), src.get_path (), dest.get_path ());
				} else {
					stdout.printf ("%s: %s\n", event.to_string (), src.get_path ());
				}
			});
			new MainLoop().run();

		}catch(Error e) {
			stdout.printf("%s\n", e.message);
		}
	}

	static int main() {
		var app = new FileMonDemo();
		return 0;
	}
}
