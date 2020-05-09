using Bodhi;

public class Test : Object {

    public static int main (string[] args) {
        Engine.start();

        var log = Engine.get_log();
        var window = Engine.get_window();
        window.set_title("OpenAL test");
        var scene = Engine.get_scene();
        var input = Engine.get_input();
        var audio = Engine.get_audio();
        var listener = audio.get_listener();

        listener.set_positionf(10, 5, 9);
        Vector3f pos = listener.get_positionv();
        log.write(pos.to_string() + "\n");

        var audio_file = audio.open_audio_file("../examples/assets/vase3.wav", true);
        var audio_source = audio.new_audio_source();
        audio_source.set_audio_file(audio_file);
        audio_source.play();

        while (Engine.is_running()) {
            Engine.update();

            scene.begin(RGBAColorf.GREEN());
            scene.end();

            if (input.is_key_press(Input.Keys.ESCAPE)) {
                Engine.stop();
            }
        }

        return 0;
    }
}
