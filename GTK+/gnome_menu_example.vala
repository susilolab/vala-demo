class GMenuExample
{
	public List<GMenu.TreeDirectory> get_main_directories() {
		var tree = GMenu.Tree.lookup("applications.menu", GMenu.TreeFlags.INCLUDE_EXCLUDED);
		var root = tree.get_root_directory();

		var dirs = new List<GMenu.TreeDirectory> ();
		foreach(GMenu.TreeItem item in root.get_contents()) {
			if(item.get_type() == GMenu.TreeItemType.DIRECTORY) {
				dirs.append((GMenu.TreeDirectory) item);
			}
		}
		return dirs;
	}

	public List<GMenu.TreeEntry> get_entries_flat(GMenu.TreeDirectory directory) {
		var entries = new List<GMenu.TreeEntry> ();
		foreach(GMenu.TreeItem item in directory.get_contents()) {
			switch(item.get_type()) {
				case GMenu.TreeItemType.DIRECTORY:
					entries.concat(get_entries_flat( (GMenu.TreeDirectory) item));
					break;
				case GMenu.TreeItemType.ENTRY:
					entries.append((GMenu.TreeEntry) item);
					break;
			}
		}
		return entries;
	}

	public DesktopAppInfo get_desktop_app_info(GMenu.TreeEntry entry) {
		return new DesktopAppInfo.from_filename(entry.get_desktop_file_path());
	}

	public void launch_desktop_app_info(DesktopAppInfo info) {
		try{
			info.launch(null, new AppLaunchContext());
		}catch(Error e) {
			stdout.printf("Error: %s\n", e.message);
		}
	}
}

static int main (string[] args) {
	var sample = new GMenuExample();

	stdout.printf("\nGet all main directories:\n");
	var directories = sample.get_main_directories();
	foreach(var directory in directories) {
		stdout.printf("%s\n", directory.get_name());
	}

	stdout.printf("\nGet all entries/directories for the first directory:\n");
	var entries = sample.get_entries_flat(directories.nth_data(0));
	foreach(var entry in entries) {
		stdout.printf("%s\n", entry.get_name());
	}
    return 0;
}
