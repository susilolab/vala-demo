class DemoStack: Object
{
	int[] stack;
	int top = 0;
	public DemoStack() {
	}

	public void run() {

	}

	public void push(int x) {
	}

	static void main () {
		string input = "";
		var app = new DemoStack();
		app.run();

		do {
			stdout.printf("Ketikan nama: ");
			input = stdin.read_line();
			stdout.printf("%s\n", input);
		}while(input != "q" && input != "Q");
	}
}