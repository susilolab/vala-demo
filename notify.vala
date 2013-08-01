public class Person: Object
{
	public string name { get; set; }
	public static int main(string[] args) {
		var person = new Person();
		person.notify.connect( (sender, property) => {
			stdout.printf("Property '%s' has changed\n", property.name);
		});
		person.name = "Foo";
		person.name = "Bar";
		return 0;
	}
}