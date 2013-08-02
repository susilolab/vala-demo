#! /usr/bin/env python
import pygtk
import gtk

class TutorialApp(object):
	def __init__(self):
		builder = gtk.Builder()
		builder.add_from_file("tutorial.glade")
		# builder.connect_signals({ "on_window_destroy": gtk.main_quit() })
		self.window = builder.get_object("window")
		self.window.show()

if __name__ == "__main__":
	app = TutorialApp()
	gtk.main()
