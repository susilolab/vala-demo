double[] get_list() {
	return new double[]{1,2,3};
}

int main() {
	double[] x = {1,2,3,4,5};

	for(int i=0; i<x.length; i++) {
		stdout.printf("%.2f ", x[i]);
	}
	stdout.printf("\n");

	double[] y = get_list();	
	for(int i=0; i<y.length; i++) {jso
		stdout.printf("%.2f ", y[i]);
	}
	stdout.printf("\n");
	return 0;
}
