public class NumberGuessing
{
	private int min;
	private int max;
	
	public NumberGuessing(int min, int max) {
		this.min = min;
		this.max = max;
	}
		
	public void start() {
		int try_count = 0;
		int number = Random.int_range(min, max);
		
		stdout.printf("Welcome to Number Guessing\n");
		stdout.printf("I have thought up a number between %d and %d\n", min, max);
		stdout.printf("Which you have to guess now. Don't worry, I will\n");
		stdout.printf("give you some hints\n\n");
		
		while(true) {
			try_count++;
			stdout.printf("Try #%d\n", try_count);
			stdout.printf("Please enter a number between %d and %d:", min, max);
			int input = int.parse(stdin.read_line());
			
			if(number == input) {
				stdout.printf("Congratulations! You win\n");
				break;
			}else {
				stdout.printf("Wrong. The wanted number is %s than %d\n",
					number > input? "greater": "less", input);
			}
		}
	}

	public static int main(string[] args) {
		var game = new NumberGuessing(1, 10);
		game.start();
		
    	return 0;
    }
}
