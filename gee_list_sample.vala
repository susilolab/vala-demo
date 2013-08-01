using Gee;
void main() {
	var list = new ArrayList<int>();
	list.add(1);
	list.add(2);
	list.add(5);
	list.add(4);
	list.insert(2, 3);
	list.remove_at(3);
	foreach(int i in list) {
		stdout.printf("%d\n", i);
	}
	
	list[2] = 10; // list.set(2, 10);
	stdout.printf("%d\n", list[2]); // list.get(2);
}
