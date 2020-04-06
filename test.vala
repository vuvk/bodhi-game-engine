using Bodhi;

public class Test : Object {

    private const int SCREEN_WIDTH = 800;
    private const int SCREEN_HEIGHT = 600;
    private const int SCREEN_BPP = 32;
    private const int DELAY = 50;

    public static int main (string[] args) {
        Bodhi.Log.set_output_file("log.log");
        Bodhi.Log.set_truncate_output_file(true);
        Bodhi.Log.set_writing_to_file(true);

        Engine.start (SCREEN_WIDTH, SCREEN_HEIGHT, true, false);

        RendererWindow window = Engine.get_window();
        window.set_title("Hello!");

        Scene scene = Engine.get_scene();

        Input input = Engine.get_input();
        print("eto " + ((int)(Input.Keycode.ESCAPE)).to_string());

        while (Engine.is_running()) {
            Engine.update();
            
            scene.begin(RGBAColorf.WHITE);
            scene.end();

            window.set_title("Hello! FPS: " + Engine.get_fps().to_string());

            if (input.is_key_down()) {
                if (input.is_key_pressed(Input.Keycode.ESCAPE)) {
                    Engine.stop();
                }
            }
        }
        
        Engine.stop();

        return 0;
    }
}

