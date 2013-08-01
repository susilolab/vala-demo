int main(string[] args) {
	var list = new List<string> ();
	list.append("satu");
	list.append("dua");
	list.append("tiga");
	
	stdout.printf("list.length () = %u\n", list.length());
	foreach(string element in list) {
		stdout.printf("%s\n", element);
	}
	return 0;
}
