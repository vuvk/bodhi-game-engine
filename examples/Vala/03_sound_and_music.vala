using Bodhi;

public class Test : Object {


    public static int main (string[] args) {
        int step = 0;

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

        var audio_file_precaching = audio.open_audio_file("../examples/assets/vase3.wav", true );
        var audio_file_streaming  = audio.open_audio_file("../examples/assets/vase3.wav", false);

        var audio_source = audio.new_audio_source();

        // step 1 - play precached sound
        audio_source.set_audio_file(audio_file_precaching);
        audio_source.play();
        log.write("Now test playing precached audio file\n");

        while (Engine.is_running()) {
            Engine.update();

            if (audio_source.is_stopped()) {
                switch (step) {
                    case 0 :
                        audio_source.set_audio_file(audio_file_streaming);
                        audio_source.play();
                        ++step;
                        log.write("Now test playing streamed audio file\n");
                        break;
                    }
            }

            scene.begin(RGBAColorf.GREEN());
            scene.end();

            if (input.is_key_press(Input.Keys.ESCAPE)) {
                Engine.stop();
            }
        }

        return 0;
    }
}
