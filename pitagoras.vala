using GLib;

void main () {
	// a = sqrt(b*2 + c*2);
	double a;
	double b = 3;
	double c = 4;
	double b_s = b*b;
	double c_s = c*c;
	double x = b_s+c_s;
	
	stdout.printf("b=3, c=4, a=?. a= %.2lf\n", Math.sqrt(x));
}
