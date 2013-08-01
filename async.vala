async void list_dir() {
	var dir = File.new_for_path(Environment.get_home_dir());
	try {
		var e = yield dir.enumerate_children_async(
			FileAttribute.STANDARD_NAME, 0, Priority.DEFAULT, null
		);
		
		while(true) {
			var files = yield e.next_files_async(
				10, Priority.DEFAULT, null
			);
			
			if(files == null) {
				break;
			}
			
			foreach(var info in files) {
				print("%s\n", info.get_name());
			}
		}
		
	}catch(Error err) {
		warning("Error: %s\n", err.message);
	}
}

void main() {
	var loop = new MainLoop();
	list_dir.begin( (obj, res) => {
			list_dir.end(res);
			loop.quit();
		}
	);
	loop.run();
}
