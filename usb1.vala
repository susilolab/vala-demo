using USB;

class DemoUsb: Object
{
	public unowned Bus buss;

	public DemoUsb() {
	}

	public void run() {
		USB.init();
		USB.find_busses();
		USB.find_devices();

		this.buss = USB.get_busses();
	}

	public static void main() {
		var app = new DemoUsb();
		app.run();
	}
}
