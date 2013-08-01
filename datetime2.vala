void main()
{
	var d = new DateTime.now_local();

	stdout.printf("%d\n", d.get_month());

	int i=0;
	do {
		stdout.printf("%d\n", i);
		i--;
	}while(i > 0);
}
