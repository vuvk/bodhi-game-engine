using SDL;
using GLEW;
using GL;

namespace Bodhi {

    public class Renderer : Object {

        /** state of renderer */
        public enum States {
            NOT_CREATED,
            CREATED
        }
        
        //static SDL_Renderer* _sdlRenderer;
        private Video.GL.Context gl_context = null;
        private States state = States.NOT_CREATED;
        private static Renderer INSTANCE = null;

        private Renderer() {
            if (create() == Errors.NO_ERROR) {
                INSTANCE = this;
            } else {
                INSTANCE = null;
            }
        }
        
        ~Renderer() {
            if (gl_context != null) {
                //free(gl_context);
                gl_context = null;
            }
            INSTANCE = null;
            
            state = States.NOT_CREATED;
        }

        internal static unowned Renderer? get_instance() {
            if (INSTANCE == null) {
                new Renderer();
            }

            return INSTANCE;
        }

        private int create() {
            /* what do you want if engine is not created, hmm??*/
            if (Engine.get_state() == Engine.States.NOT_RUNNING) {
                Log.write_error("Could not create OpenGL context, because engine not running!\n");
                return Errors.ENGINE_NOT_CREATED;
            }

            /* what do you want if window is not created, hmm??*/
            RendererWindow window = RendererWindow.get_instance();
            if (window == null || window.get_state() == RendererWindow.States.NOT_CREATED) {
                Log.write_error("Could not create OpenGL context, because window not created!\n");
                return Errors.WINDOW_NOT_CREATED;
            }

            /* what do you want, if renderer is already created? */
            if (INSTANCE != null && INSTANCE.state == States.CREATED) {
                Log.write_warning("Renderer is already created!\n");
                return Errors.NO_ERROR;
            }

            /* try to create OpenGL context */
            gl_context = Video.GL.Context.create(window.get_sdl_class());
            if (gl_context == null) {
                Log.write_error("Could not create OpenGL context! Error : " + SDL.get_error() + "\n");
                return Errors.GL_CONTEXT_NOT_CREATED;
            }

            // сглаживание
            glHint(GL_POINT_SMOOTH_HINT, GL_NICEST);
            glHint(GL_LINE_SMOOTH_HINT, GL_NICEST);
            glHint(GL_POLYGON_SMOOTH_HINT, GL_NICEST);
            glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
    //      glHint(GL_GENERATE_MIPMAP_HINT, GL_NICEST);
            glHint(GL_TEXTURE_COMPRESSION_HINT, GL_NICEST);

            // тест глубины
            glClearDepth(1.0f);
            glDepthFunc(GL_LEQUAL);
            glEnable(GL_DEPTH_TEST);
            glShadeModel(GL_SMOOTH);

            /* initialize GL extensions */
            glewInit();

            /* now render is created */
            state = States.CREATED;

            return 0;
        }

        public Vector2i get_max_screen_resolution() {
            int x = 0, 
                y = 0;
            get_max_screen_resolution_i(ref x, ref y);
            return { x, y };
        }

        public void get_max_screen_resolution_i(ref int width, ref int height) {
            Video.Display display = {};

            int displayModeCount = display.num_modes();
            if (displayModeCount < 1) {
                return;
            }

            int w = 0, h = 0;
            Video.DisplayMode mode;
            for (int i = 0; i < displayModeCount; ++i) {
                if (display.get_mode(i, out mode) != 0) {
                    Log.write_error("SDL_GetDisplayMode failed: " + SDL.get_error() + "\n");
                    return;
                }

                if (mode.w > w) {
                    w = mode.w;
                }

                if (mode.h > h) {
                    h = mode.h;
                }
            }

            width = w;
            height = h;
        }
    /*
        public int32 RenderGetMaxScreenResolutionWidth()
        {
            int32 width;
            RenderGetMaxScreenResolutioni(&width, NULL);
            return width;
        }

        public int32 RenderGetMaxScreenResolutionHeight()
        {
            int32 height;
            RenderGetMaxScreenResolutioni(NULL, &height);
            return height;
        }
    */
        //system
        public States get_state() {
            return state;
        }

        public string get_vendor() {
            string? vendor = glGetString(GL_VENDOR);
            return (vendor != null) ? vendor : "unknown";
        }

        public string get_opengl_version() {
            string? version = glGetString(GL_VERSION);
            return (version != null) ? version : "unknown";
        }

        public string get_shader_version() {
            string? glsl_version = glGetString(GL_SHADING_LANGUAGE_VERSION);
            return (glsl_version != null) ? glsl_version : "unknown";
        }

        public int get_depth_buffer_size() {
            int bits = 0;
            //glGetIntegerv(GL_DEPTH_BITS, &bits);
            Video.GL.get_attribute(Video.GL.Attributes.DEPTH_SIZE, out bits);
            return bits;
        }

        public int get_stencil_buffer_size() {
            int bits = 0;
            //glGetIntegerv(GL_STENCIL_BITS, &bits);
            Video.GL.get_attribute(Video.GL.Attributes.STENCIL_SIZE, out bits);
            return bits;
        }

        public void print_info() {
            string vendor = get_vendor();
            string version = get_opengl_version();
            string glsl_version = get_shader_version();
            
            Log.write_message(
                "============================================\n" +
                @"Vendor : $vendor\n" +
                @"OpenGL version : $version\n" +
                @"GLSL version : $glsl_version\n" +
                "============================================\n"
            );
        }

        public void print_display_modes() {
            Video.Display display = {};

            int displayModeCount = display.num_modes();
            if (displayModeCount < 1) {
                return;
            }

            Log.write_message("Display modes:\n");
            Video.DisplayMode mode;
            for (int i = 0; i < displayModeCount; ++i) {
                if (display.get_mode(i, out mode) != 0) {
                    Log.write_error("SDL_GetDisplayMode failed: " + SDL.get_error() + "\n");
                    return;
                }

                Log.write_message(
                    @"width\t$(mode.w)\t" + 
                    @"height\t$(mode.h)\t" + 
                    @"refresh rate\t$(mode.refresh_rate)\n"
                );        
            }
        }
    }

}
