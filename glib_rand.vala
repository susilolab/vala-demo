// valac glib_rand.vala

class DemoRand
{
	public DemoRand() {
	}

	public static int main(string[] args) {
		Rand rnd = new Rand();

		double dbl = rnd.next_double();
		double dbl_range = rnd.double_range(1, 20);

		stdout.printf("next_double: %.lf\n", dbl * 10);
		stdout.printf("double_range: %.lf\n", dbl_range);

		return 0;
	}
}
