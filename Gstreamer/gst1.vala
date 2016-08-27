using Gst;

void main(string[] args) {
	Gst.init(ref args);
	var pipeline = new Pipeline("test");
	var src = ElementFactory.make("audiotestsrc", "my_src");
	var sink = ElementFactory.make("autoaudiosink", "my_sink");

	pipeline.add_many(src, sink);
	src.link(sink);
	src.set("wave", 1);

	pipeline.set_state(State.PLAYING);
	new MainLoop().run();
}
