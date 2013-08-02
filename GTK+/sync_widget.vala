using Gtk;

public class SyncSample: Window
{
	private SpinButton spin_box;
	private Scale slider;
	
	public SyncSample() {
		this.title                                    = "Enter your age";
		this.window_position                          = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		set_default_size(300, 20);
		
		spin_box                                      = new SpinButton.with_range(0, 130, 1);
		slider                                        = new Scale.with_range(Orientation.HORIZONTAL, 0, 130, 1);
		spin_box.adjustment.value_changed.connect( () => {
		slider.adjustment.value                       = spin_box.adjustment.value;
		});
		
		slider.adjustment.value_changed.connect( ()   => {
		spin_box.adjustment.value                     = slider.adjustment.value;
		});
		spin_box.adjustment.value                     = 35;
		
		var hbox                                      = new Box(Orientation.HORIZONTAL, 5);
		hbox.homogeneous                              = true;
		hbox.add(spin_box);
		hbox.add(slider);
		add(hbox);
	}
	
	public static int main(string[] args) {
		Gtk.init(ref args);
		
		var window = new SyncSample();
		window.show_all();
		
		Gtk.main();
		return 0;
	}
}
