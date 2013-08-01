using Gee;
void main() {
	var my_set = new HashSet<string>();
	my_set.add("one");
	my_set.add("two");
	my_set.add("three");
	my_set.add("two");
	foreach(string s in my_set) {
		stdout.printf("%s\n", s);
	}
}
