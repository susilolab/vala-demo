// valac --pkg gio-2.0 del_file.vala
int main() {
	File file = File.new_for_path("/home/susilo/demo.vala");
	try{
		file.delete(null);

	}catch(Error e) {
		stderr.printf("%s\n", e.message);
	}

	return 0;
}