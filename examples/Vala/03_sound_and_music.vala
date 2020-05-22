using Bodhi;

public class Test : Object {

    public static int main (string[] args) {
        int step = 0;
        Vector3f source_position = { 0, 0, -1 };
        float angle = 0.0f;
        const float RADIUS = 1.5f;

        Engine.start(512, 384);

        var log = Engine.get_log();
        var window = Engine.get_window();
        window.set_title("OpenAL test");
        var scene = Engine.get_scene();
        var input = Engine.get_input();
        var audio = Engine.get_audio();
        var rm    = Engine.get_resource_manager();

        FileSystem.mount("../examples/assets.7z");

        var audio_file_precaching = rm.open_audio_file("vase3.wav", true );
        var audio_file_streaming  = rm.open_audio_file("vase3.wav", false);

        var audio_source = audio.new_audio_source();

        // step 1 - play precached sound
        audio_source.set_audio_file(audio_file_precaching);
        audio_source.play();
        log.write("Now test playing precached audio file\n");

        float delay = 0;

        while (Engine.is_running()) {
            Engine.update();

            switch (step) {
                case 0 :
                    if (audio_source.is_stopped()) {
                        // step 2 - play streaming sound
                        audio_source.set_audio_file(audio_file_streaming);
                        audio_source.play();
                        ++step;
                        log.write("Now test playing streamed audio file\n");
                    }
                    break;

                case 1 :
                    if (audio_source.is_stopped()) {
                        // step 3 - play streaming sound and pause
                        audio_source.play();
                        ++step;
                        log.write("Now test playing streamed audio file with pause\n");
                    }
                    break;

                case 2 :
                    // step 4 - pause
                    if (delay < 1.0f) {
                        delay += Engine.get_delta_time();
                    } else {
                        audio_source.pause();
                        ++step;
                        delay = 0.0f;
                        log.write("Audio source paused\n");
                    }
                    break;

                case 3 :
                    // step 5 - resume
                    if (delay < 1.0f) {
                        delay += Engine.get_delta_time();
                    } else {
                        audio_source.play();
                        ++step;
                        log.write("Audio source resumed\n");
                    }
                    break;

                case 4 :
                    // step 6 - test stereo effect and looping sound
                    if (audio_source.is_stopped()) {
                        audio_source.set_positionv(source_position);
                        audio_source.set_relative(true);
                        ++step;
                        log.write("Now test 3d sound\n");
                        audio_source.play(true);
                    }
                    break;

                case 5 :
                    // update source position
                    angle += 30 * Engine.get_delta_time();
                    if (angle > 360.0f) {
                        angle -= 360.0f;
                    }
                    float rad = MathUtil.deg_to_rad(angle);
                    source_position.x =  RADIUS * Math.cosf(rad);
                    source_position.z = -RADIUS * Math.sinf(rad);
                    audio_source.set_positionv(source_position);
                    break;
            }

            scene.begin(RGBAColorf.GREEN());
            scene.end();

            if (input.is_key_press(Input.Keycode.ESCAPE)) {
                Engine.stop();
            }
        }

        return 0;
    }
}
