// valac --pkg gstreamer-0.10 gstream_sample2.vala

using Gst;

class AudioPlayer
{
	public Element pipeline;
	public Bus bus;
	public Message msg;

	public AudioPlayer() {
		run();
	}

	public void run() {
		try {
			this.pipeline = Gst.parse_launch("playbin2 uri=http://localhost/videos/Linux/2012_What_a_Year_for_Linux.flv");
		}catch(Error e) {
			stdout.printf("%s\n", e.message);
		}

		this.pipeline.set_state(State.PLAYING);

		this.bus = this.pipeline.get_bus();
		this.msg = this.bus.timed_pop_filtered(Gst.CLOCK_TIME_NONE, MessageType.ERROR | MessageType.EOS);
	}

	public static int main(string[] args) {
		Gst.init(ref args);

		var player = new AudioPlayer();
		player.run();

		return 0;
	}
}
