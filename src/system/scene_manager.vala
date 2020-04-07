using SDL;
using GL;

namespace Bodhi {

    public class Scene : Object {   
        private bool is_3d_mode;    
        private Matrix4x4 modl;
        private Matrix4x4 pers;
        private RendererWindow window;
        private Video.Window* sdl_window;

        internal Scene() {
            modl = new Matrix4x4();
            pers = new Matrix4x4();
            window = RendererWindow.get_instance();
            sdl_window = window.get_sdl_class();
        }

        public void begin(RGBAColorf clear_color = RGBAColorf.BLACK()) { 
            beginf(clear_color.r, clear_color.g, clear_color.b, clear_color.a);
        }

        public void beginf(float r = 0.0f, float g = 0.0f, float b = 0.0f, float a = 0.0f) { 
            // очистка экрана
            glClearColor(r, g, b, a);
            glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        
            glMatrixMode(GL_PROJECTION);
            glLoadIdentity();
        
            // выставляем перспективу и вьюпорт по размеру окна
            var win_size = window.get_size();
            //gluPerspective(45.0f, (float)windowWidth / windowHeight, 0.1f, 1000.0f);
            glLoadMatrixf(pers.get_array());
            glViewport(0, 0, win_size.x, win_size.y);
        
            // переходим в режим модели
            glMatrixMode(GL_MODELVIEW);
            glLoadIdentity();
        
            glEnable(GL_DEPTH_TEST);
        }

        public void end() {
            Video.GL.swap_window(sdl_window);
        }
    }
}