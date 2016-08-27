void main () {
	GenericArray<int> data = new GenericArray<int>();
	data.add(1);
	data.add(2);
	data.add(3);

	data.foreach( (x) => {
		stdout.printf("%d ", x);
	});
	stdout.printf("\n");
}
