/**
 * array.vala
 * Mendemokan cara membuat array
 */
public class Person: Object
{
	public string name { get; construct; }
	public int age { get; construct set; }

	public Person(string name) {
		Object(name: name);
	}

	public Person.with_age(string name, int years) {
		Object(name: name, age: years);
	}

	construct {
		stdout.printf("Welcome %s\n", this.name);
	}

	public static int main(string[] args) {
		var person = new Person("Agus Susilo");
		var persons = new Person.with_age("Agus Susilo", 28);
		return 0;
	}
}
