// valac --pkg gstreamer-0.10 gstreamer_sample.vala

using Gst;

class AudioPlayer
{
	private MainLoop loop = new MainLoop();
	private dynamic Element playbin;
	
	private void foreach_tag(Gst.TagList list, string tag) {
		switch(tag) {
			case "title":
				string tag_string;
				list.get_string(tag, out tag_string);
				stdout.printf("tag: %s= %s\n", tag, tag_string);
				break;
			
			default:
				break;
		}
	}
	
	private bool bus_callback(Gst.Bus bus, Gst.Message message) {
		switch(message.type) {
			case MessageType.ERROR:
				GLib.Error err;
				string debug;
				message.parse_error(out err, out debug);
				stdout.printf("Error: %s\n", err.message);
				loop.quit();
				break;
				
			case MessageType.EOS:
				stdout.printf("End of stream\n");
				playbin.set_state(Gst.State.NULL);
				loop.quit();
				break;
				
			case MessageType.STATE_CHANGED:
				Gst.State oldstate;
				Gst.State newstate;
				Gst.State pending;
				message.parse_state_changed(out oldstate, out newstate, out pending);
				break;
				
			case MessageType.TAG:
				Gst.TagList tag_list;
				stdout.printf("taglist found\n");
				message.parse_tag(out tag_list);
				tag_list.foreach((TagForeachFunc) foreach_tag);
				break;
			
			default:
				break;
		}
		return true;
	}

	public void play(string uri) {
		playbin = ElementFactory.make("playbin", "play");
		playbin.uri = uri;
		
		Bus bus = playbin.get_bus();
		bus.add_watch(bus_callback);
		
		playbin.set_state(State.PLAYING);
		loop.run();
	}
	
	const string DEFAULT_STREAM = "file:///home/susilo/Others/programming/vala/hiragi.ogg";
	static int main(string[] args) {
		Gst.init(ref args);

		var player = new AudioPlayer();
		player.play(args.length > 1? args[1]: DEFAULT_STREAM);
		return 0;
	}
}
