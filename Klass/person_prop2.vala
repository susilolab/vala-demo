/**
* Contoh property dengan private set,
* hanya get yang boleh di akses public
*/

public class Person: Object
{
	private int _age = 28;

	public int age {
		get { return _age; }
	}

	public static int main(string[] args) {
		Person person = new Person();
		// person.age = 30;
		stdout.printf("Umur: %d\n", person.age);
		return 0;
	}
}