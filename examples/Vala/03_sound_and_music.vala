using Bodhi;

public class Test : Object {

    public static int main (string[] args) {
        Engine.start();

        var window = Engine.get_window();
        window.set_title("OpenAL test");
        var scene = Engine.get_scene();
        var input = Engine.get_input();
        var audio = Engine.get_audio();

        while (Engine.is_running()) {
            Engine.update();

            scene.begin();
            scene.end();

            if (input.is_key_press(Input.Keys.ESCAPE)) {
                Engine.stop();
            }
        }

        return 0;
    }
}
