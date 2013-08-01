//valac --pkg gio-2.0 dir_list.vala
void get_listing (string dir) {
    try {
        var directory = File.new_for_path (dir);

        var enumerator = directory.enumerate_children (FileAttribute.STANDARD_NAME, 0);

        FileInfo file_info;
        while ((file_info = enumerator.next_file ()) != null) {
            stdout.printf(file_info.get_file_type().to_string());
            if (file_info.get_file_type() == FileType.DIRECTORY) {
                get_listing(file_info.get_name());
            } else {
                stdout.printf ("%s\n", file_info.get_name ());
            }
        }

    } catch (Error e) {
        stderr.printf ("Error: %s\n", e.message);
        return;
    }
}

int main (string[] args) {
    get_listing("/home/susilo/Others/programming/vala");
    // get_listing("/home/susilo/Downloads");

    return 0;
}