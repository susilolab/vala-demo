public class ForSample : Object
{
	public ForSample() {
	}

	public void run() {
		int[] num = {1,2,3,4,5};
		int i = 0;
		for(i=0; i<num.length; i++) {
			stdout.printf("%d ", num[i]);
		}
		stdout.printf("\n");
	}

	public static int main(string[] args) {
		var app = new ForSample();
		app.run();

    	return 0;
    }
}
