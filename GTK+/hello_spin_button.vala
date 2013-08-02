// valac --pkg gtk+-3.0 hello.vala

using Gtk;

public class Sample: Window
{
	public Sample() {
		this.title           = "Contoh Spin button";
		this.border_width    = 1;
		this.window_position = WindowPosition.CENTER;

		this.set_default_size (350,70);
		this.destroy.connect(Gtk.main_quit);

				
		var spin_button = new SpinButton.with_range(1, 10, 1);
		var label       = new Label("Choose a number");
		spin_button.value_changed.connect( () => {
			label.set_text("value: %.0f".printf(spin_button.get_value()));
		});
		
		var box = new Box(Orientation.HORIZONTAL, 0);
		box.pack_start(label, false, false, 0);
		box.pack_start(spin_button, false, false, 0);

		this.add(box);
	}

	public static int main(string[] args) {
		Gtk.init (ref args);
		
		var window = new Sample();
		window.show_all();

		Gtk.main();
		return 0;
	}
}