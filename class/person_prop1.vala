public class Person: Object
{
	private int _age = 28;

	public int age {
		get { return _age; }
		set { _age = value; }
	}

	public static int main(string[] args) {
		Person person = new Person();
		person.age = 30;
		stdout.printf("Setelah person.age = 30\n");
		stdout.printf("Umur: %d\n", person.age);

		stdout.printf("Setelah person.age++\n");
		person.age++;
		stdout.printf("Umur: %d\n", person.age);
		return 0;
	}
}