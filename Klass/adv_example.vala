public class AdvancedSample : Object
{
	public string name { get; set; }
	public signal void foo();
	
	public AdvancedSample(string name) {
		this.name = name;
	}
	
	public void run() {
		this.foo.connect( (s) => {
			stdout.printf("Lambda expression %s!\n", this.name);
		});
		this.foo();
	}

	public static int main(string[] args) {
		foreach(string arg in args) {
			var sample = new AdvancedSample(arg);
			sample.run();
		}		
    	return 0;
    }
}
