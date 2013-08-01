void cb_copy(int64 x, int64 y) {
	// stdout.printf("%l of %l\n", x, y);
}

int main() {
	File file = File.new_for_path("/home/susilo/master/Operating System/deepin_12.06_en_i386.iso");
	File dest = File.new_for_path("/home/susilo/deepin_12.06_en_i386.iso");
	try{
		file.move(dest, FileCopyFlags.NONE, null, cb_copy(int64 x, int64 y));

	}catch(Error e) {
		stderr.printf("%s\n", e.message);
	}

	return 0;
}