//using GLEW;
//using GL;
using GLES2;

namespace Bodhi {

    public class Renderer : SubSystem {

        internal Renderer() {
            base();
            subsystem_name = "Renderer";
        }

        ~Renderer() {
            deinit();
        }

        protected override Errors init() {
            /* what do you want if engine is not created, hmm??*/
            if (!Engine.is_running()) {
                stderr.printf("Could not create OpenGL context, because engine not running!\n");
                return Errors.ENGINE_NOT_CREATED;
            }

            /* what do you want if window is not created, hmm??*/
            RendererWindow window = Engine.get_window();
            if (window == null || !window.is_initialized()) {
                Engine.get_log().write_error("Could not create OpenGL context, because window not created!\n");
                return Errors.WINDOW_NOT_CREATED;
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

            return Errors.NO_ERROR;
        }

        public Vector2i get_screen_resolution() {
            int w = 0,
                h = 0;
            get_screen_resolutioni(out w, out h);
            return { w, h };
        }

        public void get_screen_resolutioni(out int width, out int height) {
            width  = GLUT.glutGet(GLUT.GLUT_SCREEN_WIDTH );
            height = GLUT.glutGet(GLUT.GLUT_SCREEN_HEIGHT);
        }

        public int get_screen_resolution_width() {
            return get_screen_resolution().x;
        }

        public int get_screen_resolution_height() {
            return get_screen_resolution().y;
        }

        public string get_vendor() {
            string? vendor = is_initialized() ? glGetString(GL_VENDOR) : null;
            return (vendor != null) ? vendor : "unknown";
        }

        public string get_opengl_version() {
            string? version = is_initialized() ? glGetString(GL_VERSION) : null;
            return (version != null) ? version : "unknown";
        }

        public string get_shader_version() {
            string? glsl_version = is_initialized() ? glGetString(GL_SHADING_LANGUAGE_VERSION) : null;
            return (glsl_version != null) ? glsl_version : "unknown";
        }

        public int get_depth_buffer_size() {
            int bits = 0;
            if (is_initialized()) {
                glGetIntegerv(GL_DEPTH_BITS, &bits);
            }
            return bits;
        }

        public int get_stencil_buffer_size() {
            int bits = 0;
            if (is_initialized()) {
                glGetIntegerv(GL_STENCIL_BITS, &bits);
            }
            return bits;
        }

        public void print_info() {
            string vendor = get_vendor();
            string version = get_opengl_version();
            string glsl_version = get_shader_version();

            Engine.get_log().write(
                "============================================\n" +
                @"Vendor : $vendor\n" +
                @"OpenGL version : $version\n" +
                @"GLSL version : $glsl_version\n" +
                "============================================\n"
            );
        }
    }
}
