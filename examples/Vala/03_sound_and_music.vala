using Bodhi;

public class Test : Object {

    public static int main (string[] args) {
        Engine.start();

        var window = Engine.get_window();
        window.set_title("OpenAL test");   
        var scene = Engine.get_scene();
        var input = Engine.get_input();

        if (Alure.init_device(null, null)) {
            print("Wow! Alure was initialized!\n");

            uint major, minor;
            Alure.get_version(out major, out minor);
            print(@"errors? $(Alure.get_error_string())\n");
            print(@"version of Alure is $major.$minor\n");

            if (!Alure.shutdown_device()) {
                print("Oh, shit. Wasted!\n");
            }
        }

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

