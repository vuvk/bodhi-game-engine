//using GLEW;
//using GL;
using GLES2;

namespace Bodhi {

    public class Renderer : Object {

        /** state of renderer */
        public enum States {
            NOT_CREATED,
            CREATED
        }
        
        private States state = States.NOT_CREATED;
        private static Renderer? INSTANCE = null;

        private Renderer() {
            if (create() == Errors.NO_ERROR) {
                INSTANCE = this;
            } else {
                INSTANCE = null;
            }
        }
        
        ~Renderer() {
            destroy();
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

            // сглаживание
            
            //glHint(GL_POINT_SMOOTH_HINT, GL_NICEST);
            //glHint(GL_LINE_SMOOTH_HINT, GL_NICEST);
            //glHint(GL_POLYGON_SMOOTH_HINT, GL_NICEST);
            //glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
            glHint(GL_GENERATE_MIPMAP_HINT, GL_NICEST);
            //glHint(GL_TEXTURE_COMPRESSION_HINT, GL_NICEST);

            // тест глубины
            glClearDepthf(1.0f);
            glDepthFunc(GL_LEQUAL);
            glEnable(GL_DEPTH_TEST);
            //glShadeModel(GL_SMOOTH);

            /* initialize GL extensions */
            //glewInit();

            /* now render is created */
            state = States.CREATED;

            return 0;
        }

        internal void destroy() {
            INSTANCE = null;            
            state = States.NOT_CREATED;
        }

        public Vector2i get_screen_resolution() {
            int w = 0,
                h = 0;
            get_screen_resolutioni(out w, out h);

            return { w, h };
        }

        public void get_screen_resolutioni(out int width, out int height) {
            unowned GLFW.Monitor? monitor = GLFW.get_primary_monitor();
            if (monitor == null) {
                width = height = 0;
                return;
            }

            GLFW.VideoMode mode = monitor.video_mode;

            width  = mode.width;
            height = mode.height;
        }

        public int get_screen_resolution_width() {
            return get_screen_resolution().x;
        }

        public int get_screen_resolution_height() {
            return get_screen_resolution().y;
        }

        public Vector2i get_max_screen_resolution() {
            int x = 0, 
                y = 0;
            get_max_screen_resolutioni(out x, out y);
            return { x, y };
        }

        public void get_max_screen_resolutioni(out int width, out int height) {
            unowned GLFW.Monitor? monitor = GLFW.get_primary_monitor();
            if (monitor == null) {
                width = height = 0;
                return;
            }

            int w = 0, h = 0;
            foreach (GLFW.VideoMode mode in monitor.video_modes) {
                if (mode.width > w) {
                    w = mode.width;
                }

                if (mode.height > h) {
                    h = mode.height;
                }
            }

            width = w;
            height = h;
        }

        public int get_max_screen_resolution_width() {
            return get_max_screen_resolution().x;
        }

        public int get_max_screen_resolution_height() {
            return get_max_screen_resolution().y;
        }

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
            glGetIntegerv(GL_DEPTH_BITS, &bits);
            return bits;
        }

        public int get_stencil_buffer_size() {
            int bits = 0;
            glGetIntegerv(GL_STENCIL_BITS, &bits);
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
            unowned GLFW.Monitor? monitor = GLFW.get_primary_monitor();
            if (monitor == null) {
                return;
            }

            Log.write_message(@"Display modes for $(monitor.name):\n");
            foreach (GLFW.VideoMode mode in monitor.video_modes) {
                Log.write_message(
                    @"width\t$(mode.width)\t" + 
                    @"height\t$(mode.height)\t" + 
                    @"refresh rate\t$(mode.refresh_rate)\n"                    
                );  
            }
        }
    }

}
