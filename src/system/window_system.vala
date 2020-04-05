using SDL;

namespace Bodhi {

    public class RendererWindow : Object {   

        public enum States {
            NOT_CREATED,
            CREATED
        }

        public const int DEFAULT_WIDTH  = 1024;
        public const int DEFAULT_HEIGHT = 768;
        public const bool DEFAULT_RESIZABLE  = false;
        public const bool DEFAULT_FULLSCREEN = false;
        
        private static RendererWindow INSTANCE = null;
        private Video.Window sdl_window;
        private States state = NOT_CREATED;
        private int32 width;
        private int32 height;
        private bool fullscreen_mode;
        private int32 prev_width  = 0;
        private int32 prev_height = 0;

        private RendererWindow(int32 width, int32 height, bool resizable, bool fullscreen_mode) {
            if (create(width, height, resizable, fullscreen_mode) == Errors.NO_ERROR) {
                INSTANCE = this;
            } else {
                INSTANCE = null;
            }
        }
        
        ~RendererWindow() {
            destroy();
        }
        
        internal static unowned RendererWindow? get_instance(int32 width = DEFAULT_WIDTH, 
                                                             int32 height = DEFAULT_HEIGHT, 
                                                             bool resizable = DEFAULT_RESIZABLE, 
                                                             bool fullscreen_mode = DEFAULT_FULLSCREEN) {
            if (INSTANCE == null) {
                new RendererWindow(width, height, resizable, fullscreen_mode);
            }

            return INSTANCE;
        }
        
        private int create(int32 width, int32 height, bool resizable, bool fullscreen_mode) {
            /* what do you want if engine is not started, hmm??*/
            if (Engine.get_state() == Engine.States.NOT_RUNNING) {
                Log.write_error("I can't create window if engine is not started!\n");
                return Errors.WINDOW_NOT_CREATED;
            }
        
            /* what do you want, if window is already created? */
            if (INSTANCE != null && INSTANCE.state == States.CREATED) {
                Log.write_warning("RendererWindow is already created!\n");
                return Errors.NO_ERROR;
            }
        
            /* set SDL attributes */
            //SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
            //SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 1);
            Video.GL.set_attribute(Video.GL.Attributes.RED_SIZE,           8);
            Video.GL.set_attribute(Video.GL.Attributes.GREEN_SIZE,         8);
            Video.GL.set_attribute(Video.GL.Attributes.BLUE_SIZE,          8);
            Video.GL.set_attribute(Video.GL.Attributes.DOUBLEBUFFER,       1);
            Video.GL.set_attribute(Video.GL.Attributes.DEPTH_SIZE,         24);
            Video.GL.set_attribute(Video.GL.Attributes.BUFFER_SIZE,        32);
            Video.GL.set_attribute(Video.GL.Attributes.ACCUM_RED_SIZE,     8);
            Video.GL.set_attribute(Video.GL.Attributes.ACCUM_GREEN_SIZE,   8);
            Video.GL.set_attribute(Video.GL.Attributes.BLUE_SIZE,    8);
            Video.GL.set_attribute(Video.GL.Attributes.ALPHA_SIZE,   8);
            Video.GL.set_attribute(Video.GL.Attributes.MULTISAMPLEBUFFERS, 1);
            Video.GL.set_attribute(Video.GL.Attributes.MULTISAMPLESAMPLES, 2);
        
            /* try to create window */
            int window_flags = Video.WindowFlags.OPENGL;
            if (resizable) {
                window_flags |= Video.WindowFlags.RESIZABLE;
            }

            sdl_window = new Video.Window(@"$(Engine.get_name()) $(Engine.get_version())",
                                          Video.Window.POS_CENTERED, Video.Window.POS_CENTERED,
                                          width, height,
                                          window_flags);
            if (sdl_window == null) {
                Log.write_error("Couldn't create window! Error: " + SDL.get_error() + "\n");
                return Errors.WINDOW_NOT_CREATED;
            }
        
            /* set full screen, if need */
            if (fullscreen_mode) {
                sdl_window.set_fullscreen(Video.WindowFlags.FULLSCREEN);
            }
        
            /* initialization */
            this.width  = width;
            this.height = height;
            this.state  = States.CREATED;
            this.fullscreen_mode = fullscreen_mode;
        
            return Errors.NO_ERROR;
        }

        public void destroy() {
            Renderer render = Renderer.get_instance();
            if (render != null) {
                render.destroy();
            }

            if (sdl_window != null) {
                sdl_window.destroy();
                sdl_window = null;
            }

            INSTANCE = null;
        
            state = States.NOT_CREATED;
        }
        
        public void set_size(Vector2i size) {
            set_size_i(size.x, size.y);
        }
        
        public void set_size_i(int32 width, int32 height) {
            sdl_window.set_size(width, height);
            this.width  = width;
            this.height = height;
        }
        
        public void set_title(string windowTitle) {
            sdl_window.title = windowTitle;
        }
        
        public void set_fullscreen(bool fullscreen_mode, bool use_desktop_resolution = true) {
            if (fullscreen_mode) {
                if (!use_desktop_resolution) {
                    sdl_window.set_fullscreen(Video.WindowFlags.FULLSCREEN);
                } else {
                    sdl_window.set_fullscreen(Video.WindowFlags.FULLSCREEN_DESKTOP);
                }
            } else {
                sdl_window.set_fullscreen(0);
            }
        }
        //void EngineSetRendererWindowResizable(bool isResizable);
        
        //windows gets
        public Vector2i get_size() {
            return { width, height };
        }
        
        public unowned string? get_title() {
            return sdl_window.title;
        }
        
        public int get_width() {
            return width;
        }
        
        public int get_height() {
            return height;
        }
        
        // system
        public void update() {    
            if (sdl_window != null) {
                sdl_window.get_size(out width, out height);
        
                if ((width  != prev_width) ||
                    (height != prev_height)) {
                    // !!!
                    // Perspectivef_M4x4(_pers, 60.0f, (float)width / height, 0.1f, 1000.0f);
        
                    prev_width  = width;
                    prev_height = height;
                }
            } else {
                width  = 0;
                height = 0;
                state  = States.NOT_CREATED;
            }
        }
        
        public States get_state() {
            return state;
        }
        
        public unowned Video.Window get_sdl_class() {
            return sdl_window;
        }
    }
}