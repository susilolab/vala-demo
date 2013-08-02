// valac --pkg gtk+-3.0 hello.vala

using Gtk;

public class DemoEnvi: Object
{
	private Builder builder;
	private Window main_window;
	private TextView tv_msg;
	private Button btn_exit;
	public TextBuffer buffer;

	public DemoEnvi() {
	}

	public void run() {
		try {
			builder = new Builder();
			builder.add_from_file("envi.glade");
			builder.connect_signals(null);
			this.main_window = builder.get_object("window1") as Window;

			this.main_window.destroy.connect(Gtk.main_quit);
			this.main_window.title           = "Environment List";
			this.main_window.window_position = WindowPosition.CENTER;
			this.main_window.show_all();
			builder.connect_signals(this);

			this.btn_exit = this.builder.get_object("btn_exit") as Button;
			this.btn_exit.clicked.connect(Gtk.main_quit);

			this.tv_msg = this.builder.get_object("tv_msg") as TextView;

			this.tv_msg.buffer.text += "App Name: " + Environment.get_application_name();
			this.tv_msg.buffer.text += "\nUser Name: " + Environment.get_user_name();
			this.tv_msg.buffer.text += "\nReal Name: " + Environment.get_real_name();
			this.tv_msg.buffer.text += "\nHostname: " + Environment.get_host_name();
			this.tv_msg.buffer.text += "\nHome dir: " + Environment.get_home_dir();
			this.tv_msg.buffer.text += "\nUser data dir: " + Environment.get_user_data_dir();
			this.tv_msg.buffer.text += "\nList variables:\n";
			foreach(string var_name in Environment.list_variables()) {
				this.tv_msg.buffer.text += var_name + "= " + Environment.get_variable(var_name) + "\n";
			}

			this.tv_msg.buffer.text += "\n----------------------------";
			this.tv_msg.buffer.text += "\nConfig system dir:\n";
			foreach(string cfg in Environment.get_system_config_dirs()) {
				this.tv_msg.buffer.text += cfg + "\n";
			}

		}catch(Error e) {
			stderr.printf("%s\n", e.message);
		}
	}

	public static int main(string[] args) {
		Gtk.init (ref args);
		var app = new DemoEnvi();
		app.run();

		Gtk.main();
		return 0;
	}
}
