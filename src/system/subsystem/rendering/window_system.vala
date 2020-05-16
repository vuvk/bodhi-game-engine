//using SDL;
//using GLFW;

namespace Bodhi {

    public class RendererWindow : SubSystem {

        public const int DEFAULT_WIDTH  = 1024;
        public const int DEFAULT_HEIGHT = 768;
        public const bool DEFAULT_RESIZABLE  = false;
        public const bool DEFAULT_FULLSCREEN = false;

        private string title = @"$(Engine.get_name()) $(Engine.get_version())";
        private int width  = 0;
        private int height = 0;
        private bool resizable;
        private bool fullscreen_mode;
        private int prev_width  = 0;
        private int prev_height = 0;

        internal RendererWindow(int width, int height, bool resizable, bool fullscreen_mode) {
            this.width  = this.prev_width  = width;
            this.height = this.prev_height = height;
            this.resizable = resizable;
            this.fullscreen_mode = fullscreen_mode;

            if (init() == Errors.NO_ERROR) {
                state = State.INITIALIZED;
            }

            subsystem_name = "Renderer Window";
        }

        ~RendererWindow() {
            deinit();
        }

        protected override Errors init() {
            /* what do you want if engine is not started, hmm??*/
            if (!Engine.is_running()) {
                stderr.printf("I can't create window if engine is not started!\n");
                return Errors.WINDOW_NOT_CREATED;
            }

            /* set SDL attributes */
            //SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
            //SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 1);
            /*
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
            */
            /* try to create window */

            GLUT.glutInitWindowSize(width, height);
            GLUT.glutInitWindowPosition(100, 100);
            GLUT.glutCreateWindow(title);

            if (fullscreen_mode) {
                GLUT.glutFullScreen();
            }

            return Errors.NO_ERROR;
        }

        /*
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
        */

        //windows gets
        public Vector2i get_size() {
            int width  = 0,
                height = 0;
            get_sizei(out width, out height);
            return { width, height };
        }

        public void get_sizei(out int width, out int height) {
            if (!is_initialized()) {
                return;
            }

            width  = GLUT.glutGet(GLUT.GLUT_WINDOW_WIDTH );
            height = GLUT.glutGet(GLUT.GLUT_WINDOW_HEIGHT);
        }

        public unowned string? get_title() {
            return title;
        }

        public int get_width() {
            return get_size().x;
        }

        public int get_height() {
            return get_size().y;
        }

        public Vector2i get_position() {
            int x = 0,
                y = 0;
            get_positioni(out x, out y);
            return {x, y};
        }

        public void get_positioni(out int x, out int y) {
            if (!is_initialized()) {
                return;
            }

            x = GLUT.glutGet(GLUT.GLUT_WINDOW_X);
            y = GLUT.glutGet(GLUT.GLUT_WINDOW_Y);
        }

        public void set_size(Vector2i size) {
            set_sizei(size.x, size.y);
        }

        public void set_sizei(int width, int height) {
            if (!is_initialized()) {
                return;
            }

            GLUT.glutReshapeWindow(width, height);
        }

        public void set_title(string title) {
            if (!is_initialized()) {
                return;
            }

            this.title = title;
            GLUT.glutSetWindowTitle(title);
        }

        public void set_position(Vector2i pos) {
            set_positioni(pos.x, pos.y);
        }

        public void set_positioni(int x, int y) {
            if (!is_initialized()) {
                return;
            }

            GLUT.glutPositionWindow(x, y);
        }

        public void center() {
            if (!is_initialized()) {
                return;
            }

            Vector2i win_size = get_size();
            Renderer renderer = Engine.get_renderer();
            Vector2i screen_size = renderer.get_screen_resolution();

            Vector2i pos = {
                (screen_size.x >> 1) - (win_size.x >> 1),
                (screen_size.y >> 1) - (win_size.y >> 1)
            };

            set_position(pos);
        }

        // system
        internal void update() {
            if (!is_initialized()) {
                return;
            }

            Vector2i size = get_size();

            if ((size.x != prev_width) ||
                (size.y != prev_height)) {
                // !!!
                // Perspectivef_M4x4(_pers, 60.0f, (float)width / height, 0.1f, 1000.0f);

                if (resizable) {
                    prev_width  = size.x;
                    prev_height = size.y;
                } else {
                    set_size(prev_width, prev_height);
                }
            }
        }

        internal void swap_buffers() {
            if (!is_initialized()) {
                return;
            }

            GLUT.glutSwapBuffers();
        }
    }
}
