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
        FileSystem fs = Engine.get_file_system();

        var file = fs.new_file("test.txt", "w");
        file.write_string("Hello, pidor!\n");
        file.close();

        Engine.set_limit_fps(10);        

        while (Engine.is_running()) {
            Engine.update();
            
            scene.begin(RGBAColorf.WHITE());
            scene.end();

            window.set_title("Hello! FPS: " + Engine.get_fps().to_string());

            if (input.is_mouse_scroll_up()) {
                print("wow! wheel up!\n");
            }
            if (input.is_mouse_scroll_down()) {
                print("wow! wheel down!\n");
            }

            if (input.is_key_press(Input.Keys.ESCAPE)) {
				print("Bye-bye.\n");
                Engine.stop();
            }
        }

        return 0;
    }
}

