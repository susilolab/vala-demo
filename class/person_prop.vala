public class Person: Object
{
	private int age = 28;

	public int get_age() {
		return this.age;
	}

	public void set_age(int age) {
		this.age = age;
	}

	public static int main(string[] args) {
		Person person = new Person();
		person.set_age(30);
		stdout.printf("Umur: %d\n", person.get_age());
		return 0;
	}
}