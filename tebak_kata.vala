/**
 * Tebak Kata aka Hangman
 *
 * @author  : Agus Susilo
 * @date    : Minggu, 28 April 2013 22:00
 * @version : 1.0
 */
public class TebakKata: Object
{
	public string quiz = "Yamaha";
	private int tried;
	private int right_answer;
	private int[] stack_jwb;

	public TebakKata() {
		this.init();
	}

	public void init() {
		this.tried = 0;
		this.right_answer = 0;
	}

	public void checkAnswer(char jwb) {
		var len = this.quiz.length;
		int x = 0;
		for(int i=0; i<len; i++) {
			if(this.quiz[i] == jwb) {
				this.stack_jwb[i] = i;
				x++;
			}
		}

		if(x > 0)
			this.right_answer++;
		else
			this.tried++;
		this.draw_line(this.stack_jwb);
	}

	public void run() {
 		var len = this.quiz.length;

		while(this.tried < len && this.right_answer < len) {
			stdout.printf("Ketik jawaban Anda: ");
			char jwb = (char)stdin.read_line();

			this.checkAnswer(jwb);
		}

		for(int i=0; i<this.stack_jwb.length; i++)
			stdout.printf("%d", this.stack_jwb[i]);
	}

	private void draw_line(int[] jwb_benar) {
		for(int i=0; i<jwb_benar.length; i++) {
			if(this.stack_jwb[i] >= 0)
				stdout.printf("%c", this.quiz[i]);
			else
				stdout.printf("_");
		}
	}

	static int main() {
		var app = new TebakKata();
		app.run();

		return 0;
	}
}