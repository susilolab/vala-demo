int main (string[] args) {
    try {
        var directory = File.new_for_path(".");
        if(args.length > 1) {
            directory = File.new_for_commandline_arg(args[1]);
        }

        var enumerator = directory.enumerate_children(FileAttribute.STANDARD_NAME, 0);
        FileInfo file_info, info;
        TimeVal tv;
        while( (file_info = enumerator.next_file()) != null) {
            info = directory.query_info(FileAttribute.TIME_MODIFIED,
                GLib.FileQueryInfoFlags.NONE, null);
            tv = info.get_modification_time();

            stdout.printf("%s %s\n", file_info.get_name(), tv.to_iso8601());
        }

    }catch(Error e) {
        stderr.printf("Error: %s\n", e.message);
        return 1;
    }

    stdout.printf("\n");
    return 0;
}