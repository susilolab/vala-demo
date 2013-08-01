public class Test: GLib.Object
{
	public signal void sig_1(int a);

	public static int main(string[] args) {
		Test t1 = new Test();
		t1.sig_1.connect( (t, a) => {
			stdout.printf("%d\n", a);
		});
		t1.sig_1(5);
		
		return 0;
	}
}
