/**
 * latihan006.vala
 * 2012-09-22 23:20
 * Spawning processes
 */

void main () {
	try {
		// Non blocking
		Process.spawn_command_line_async("ls");
		// Blocking(menunggu proses sampai selesai)
		Process.spawn_command_line_sync("ls");
		// Blocking dengan keluaran
		string standard_output, standard_error;
		int exit_status;
		Process.spawn_command_line_sync("ls", out standard_output,
			out standard_error, out exit_status);
		stdout.printf(standard_output + "\n");
		stdout.printf(standard_error + "\n");
		stdout.printf("%d\n", exit_status);

	}catch(SpawnError e) {
		stderr.printf("%s\n", e.message);
	}
}
