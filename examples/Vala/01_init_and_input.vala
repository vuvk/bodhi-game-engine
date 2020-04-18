using Bodhi;

public class Test : Object {

    public static int main (string[] args) {
        Engine.start();
        // for enable logging to file you can set it after start engine
        // or start engine with function "start_with_log"
        var log = Engine.get_log();
        log.set_write_to_file("log.log");
        // test write to log
        log.write("Hello!\n");
        log.write_warning("Dangerous!\n");
        log.write_error("Critical!\n");

        RendererWindow window = Engine.get_window();
        window.set_title("Hello!");

        Scene scene = Engine.get_scene();
        Input input = Engine.get_input();

        Engine.set_limit_fps(10);        

        while (Engine.is_running()) {
            Engine.update();
            
            scene.begin(RGBAColorf.WHITE());
            scene.end();

            window.set_title("Hello! FPS: " + Engine.get_fps().to_string());

            if (input.is_mouse_scroll_up()) {
                log.write("wow! wheel up!\n");
            }
            if (input.is_mouse_scroll_down()) {
                log.write("wow! wheel down!\n");
            }

            if (input.is_key_press(Input.Keys.ESCAPE)) {
				log.write("Bye-bye.\n");
                Engine.stop();
            }
        }

        return 0;
    }
}

