// valac --pkg posix posix_sleep.vala
using Posix;

int main() {
	Posix.sleep(5);
	GLib.stdout.printf("Hello ditunda 5 detik\n");	
	return 0;
}