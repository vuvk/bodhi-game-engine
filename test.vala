using Bodhi;

public class Test : Object {

    public static int main (string[] args) {
        Bodhi.Log.set_output_file("log.log");
        Bodhi.Log.set_truncate_output_file(true);
        Bodhi.Log.set_writing_to_file(true);

        Engine.start ();

        RendererWindow window = Engine.get_window();
        window.set_title("Hello!");

        Scene scene = Engine.get_scene();
        Input input = Engine.get_input();

        Engine.set_limit_fps(30);        

        while (Engine.is_running()) {
            Engine.update();
            
            scene.begin(RGBAColorf.WHITE());
            scene.end();

            window.set_title("Hello! FPS: " + Engine.get_fps().to_string());

            if (input.is_key_press(Input.Keys.ESCAPE)) {
				print("Bye-bye.\n");
                Engine.stop();
            }
        }

        return 0;
    }
}

