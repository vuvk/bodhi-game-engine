using SDL;
using GL;

public class Scene : Object {   
    private static bool is_3d_mode;    
    private static Matrix4x4 modl;
    private static Matrix4x4 pers;
    private static RendererWindow window;

    public static void init() {
        modl = new Matrix4x4();
        pers = new Matrix4x4();
    }

    public static void begin(RGBAColorf clear_color = RGBAColorf.BLACK) {    
        window = RendererWindow.get_instance();

        // очистка экрана
        glClearColor(clear_color.r, clear_color.g, clear_color.b, clear_color.a);
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

    public static void end() {
        window = RendererWindow.get_instance();
        Video.Window* sdl_window = window.get_sdl_class();
        Video.GL.swap_window(sdl_window);
    }
}