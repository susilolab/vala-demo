//valac --pkg sdl --pkg sdl-ttf -o demo_sdl_ttf demo_sdl_ttf.vala
using SDL;
using SDLTTF;

int main()
{
           // initialize SDL and SDLTTF
        SDL.init (InitFlag.VIDEO);
        SDLTTF.init ();

           // choose the video mode & window title
        unowned Screen screen;
        screen = Screen.set_video_mode (320, 240, 16, SurfaceFlag.HWSURFACE);
        SDL.WindowManager.set_caption ("Vala SDLTTF Demo","");

           // set font with size 56
        var font = new SDLTTF.Font ("myfont.ttf", 56);

           // set color red ({ R=255, G=0, B=0 })
        SDL.Color color = { 255,0,0 };

           // create and fill image surface, with the chosen text, font & color
        Surface image;
        image = font.render_utf8 ("Hello World !", color);

           // put image on screen
        image.blit (null, screen, null);

           // loop...
        bool quit = false;
        while (!quit)
        {
                screen.flip ();
                quit = process_events ();
                SDL.Timer.delay (10);
        }

        SDLTTF.quit ();
        SDL.quit ();

        return 0;
}

   // catch events
public bool process_events ()
{
        SDL.Event e;
        while (SDL.Event.poll (out e) == 1)
        {
                if (e.type == SDL.EventType.QUIT)
                 return true;
        }
        return false;
}