/**
* Contoh Abstract class
*/

public abstract class Hewan: GLib.Object
{
	public void makan() {
		stdout.printf("* Nyam-nyam *\n");
	}

	public abstract void say_halo();
}

public class Sapi: Hewan
{
	public override void say_halo() {
		stdout.printf("Sapi say_halo():\n* Emmmoohhhhhh *\n");
	}
}

public class Macan: Hewan
{
	public override void say_halo() {
		stdout.printf("Macan say_halo():\n* Argggggghhhhhh *\n");
	}
}

static int main(string[] args) {
	Sapi sapi = new Sapi();
	sapi.makan();
	sapi.say_halo();

	Macan macan = new Macan();
	macan.makan();
	macan.say_halo();
	return 0;
}