public class SwitchSample : Object
{
	public SwitchSample() {
		int a = 1;
		switch(a) {
			case 1:
				stdout.printf("Anda memilih 1\n");
				break;
			case 2:
				stdout.printf("Anda memilih 2\n");
				break;
		}
	}
	
	public static int main(string[] args) {
		var program = new SwitchSample();
    	return 0;
    }
}
