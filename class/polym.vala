/**
* Contoh Polymor class
*/

class SuperClass: GLib.Object
{
	public virtual void method_1() {
		stdout.printf("SuperClass.method_1()\n");
	}
}

class SubClass: SuperClass
{
	public override void method_1() {
		stdout.printf("SubClass.method_1()\n");
	}
}

static int main(string[] args) {
	SubClass b = new SubClass();
	b.method_1();

	SuperClass a = new SuperClass();
	a.method_1();

	return 0;
}