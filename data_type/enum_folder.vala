int main (string[] args) {
	try {
		var directory = File.new_for_path(".");
		if(args.length > 1) {
			directory = File.new_for_commandline_arg(args[1]);
		}
		var enumerator = directory.enumerate_children(FileAttribute.STANDARD_NAME, 0);

		FileInfo file_info;
		while((file_info = enumerator.next_file()) != null) {
			stdout.printf("%s\n", file_info.get_name());
		}

	}catch(Error e) {
		stderr.printf("Error: %s\n", e.message);
		return 1;
	}

    return 0;
}
