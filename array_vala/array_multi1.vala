int main(string[] args) {
	int[2,3] x = {
		{1,2,3},
		{4,5,6}
	};
	int i = 0;
	int[] y = {10, 20, 30}; // untuk mereplace array x pertama

	stdout.printf("Array awal:\n");
	for(i=0; i<x.length[1]; i++) {
		stdout.printf("%d\n", x[0,i]);
		x[0,i] = y[i];
	}

	stdout.printf("\nArray awal:\n");
	for(i=0; i<x.length[1]; i++) {
		stdout.printf("%d\n", x[0,i]);
	}
	stdout.printf("\n");

	int j = 0;
	for(i=0; i<x.length[0]; i++) {
		for(j=0; j<x.length[1]; j++) {
			stdout.printf("%d ", x[i, j]);
		}
		stdout.printf("\n");
	}
	return 0;
}
