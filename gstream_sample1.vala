/* SoundPlayerBackend.vala */
/* Modified code from Damien Radtke's site. http://damienradtke.org/ */

using Gst;
public class SoundPlayerBackend {

    //Constants
    const double PLAYBACK_RATE_MODIFIER = 2.0;
    const int SEEK_SECONDS = 10;

    // Method delegates for notifying SoundPlayer about certain events
    protected delegate void NotifyEos();
    protected delegate void NotifyError(string message);

    // Pointer to our EOS delegate
    protected NotifyEos on_eos; 

    // Pointer to our Error delegate
    protected NotifyError on_error; 

    public static void main(string[] args){
        var soundplayer = new SoundPlayerBackend();
        Gst.init(ref args);
        soundplayer.setUri("file:///home/codenomad/Desktop/player-project/hurricane.mp3");
        soundplayer.play();
        string stop = stdin.read_line ();

        while (stop != "stop") {
            if (stop == "pause") { soundplayer.pause(); }
            else if (stop == "play") { soundplayer.play(); }
            stop = stdin.read_line ();
        }
    }

    // Read-only reference to the current sound object
    public dynamic Element sound { get; private set; } 

    // Read-only "is playing" property
    public bool is_playing { get; private set; default = false; } 

    // Read-only "rate" property
    public double rate { get; private set; default = 1; } 

    public void setUri(string uri) {
        // Make sure any existing allocated resources are freed
        if (sound != null)
            sound.set_state(Gst.State.NULL);
        sound = ElementFactory.make("playbin2", "playbin");        
        sound.uri = uri;
        var audiobin = new Bin("audioline");
        var scaletempo = ElementFactory.make("scaletempo", "scaletempo");
        var convert    = ElementFactory.make("audioconvert", "convert");
        var resample   = ElementFactory.make("audioresample", "resample");
        var audiosink = ElementFactory.make("autoaudiosink", "audiosink");

        audiobin.add_many(scaletempo, convert, resample, audiosink);

        //edited based on comment below
        //Element.link_many(scaletempo, convert, resample, audiosink);
        scaletempo.link_many(convert, resample, audiosink);

        var pad = scaletempo.get_pad("sink");
        audiobin.add_pad(new GhostPad("sink", pad));
        sound.set_property("audio-sink", audiobin);    
        sound.get_bus().add_watch(on_event);
    }

    // Play the sound
    public void play() {
        sound.set_state(State.PLAYING);
        print("Playing\n");
        is_playing = true;
    }

    // Pause it
    public void pause() {
        sound.set_state(State.PAUSED);
        is_playing = false;
        print("Paused\n");
    }

    // Event bus, listens for events and responds accordingly
    protected bool on_event(Gst.Bus bus, Message message) {
        switch (message.type) {
            case MessageType.ERROR:
                GLib.Error err;
                string debug;
                sound.set_state(Gst.State.NULL);
                is_playing = false;
                message.parse_error(out err, out debug);
                on_error(err.message);
                break;
            case MessageType.EOS:
                sound.set_state(Gst.State.READY);
                is_playing = false;
                on_eos();
                break;
            default:
                break;
        }
        return true;
    }
}
