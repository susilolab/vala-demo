using Gtk;

void dialog_response(int response_id) {
	switch(response_id) {
		case Gtk.ResponseType.OK:
			print("*boom*\n");
			break;
		case Gtk.ResponseType.CANCEL:
			print("good choice\n");
			break;
		case Gtk.ResponseType.DELETE_EVENT:
			print("dialog closed or canceled\n");
			break;
	}
	Gtk.main_quit();
}

int main(string[] args) {
	Gtk.init(ref args);
	var message_dlg = new Gtk.MessageDialog(null, Gtk.DialogFlags.MODAL,
		Gtk.MessageType.INFO,
		Gtk.ButtonsType.OK_CANCEL,
		"This action will cause the universe to stop existing"
		);

	message_dlg.response.connect(dialog_response);
	message_dlg.show();

	Gtk.main();
	return 0;
}
