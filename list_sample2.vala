int main(string[] args) {
	var list = new List<int> ();
	list.append(1);
	list.append(2);
	list.append(3);
	list.prepend(4);

	stdout.printf("list.length () = %u\n", list.length());
	foreach(int element in list) {
		stdout.printf("%d\n", element);
	}

	unowned List<int>? element = list.first();
	assert (element != null);
	stdout.printf ("Search result: %p.data: '%d'\n", element, element.data);

	return 0;
}
