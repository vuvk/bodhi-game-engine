const Bodhi = imports.gi.Bodhi;

const ENGINE = Bodhi.Engine;

ENGINE.start(512, 384, true, false);
// for enable logging to file you can set it after start engine
// or start engine with function "start_with_log"
const LOG = ENGINE.get_log();
const WINDOW = ENGINE.get_window();
WINDOW.set_title("OpenAL test");

const SCENE = ENGINE.get_scene();
const INPUT = ENGINE.get_input();
const AUDIO = ENGINE.get_audio();
const RM    = ENGINE.get_resource_manager();


var step = 0;
var source_position = [0, 0, -1];
var angle = 0.0;
const RADIUS = 1.5;

RM.mount("examples/assets.7z", "", true);

var audio_file_precaching = RM.open_audio_file_from_path("vase3.wav", true );
var audio_file_streaming  = RM.open_audio_file_from_path("vase3.wav", false);

var audio_source = AUDIO.new_audio_source();

// step 1 - play precached sound
audio_source.set_audio_file(audio_file_precaching);
audio_source.play(false);
LOG.write("Now test playing precached audio file\n");

var delay = 0;

while (ENGINE.is_running()) {
    ENGINE.update();

    switch (step) {
        case 0 :
            if (audio_source.is_stopped()) {
                // step 2 - play streaming sound
                audio_source.set_audio_file(audio_file_streaming);
                audio_source.play(false);
                ++step;
                LOG.write("Now test playing streamed audio file\n");
            }
            break;

        case 1 :
            if (audio_source.is_stopped()) {
                // step 3 - play streaming sound and pause
                audio_source.play(false);
                ++step;
                LOG.write("Now test playing streamed audio file with pause\n");
            }
            break;

        case 2 :
            // step 4 - pause
            if (delay < 1.0) {
                delay += ENGINE.get_delta_time();
            } else {
                audio_source.pause();
                ++step;
                delay = 0.0;
                LOG.write("Audio source paused\n");
            }
            break;

        case 3 :
            // step 5 - resume
            if (delay < 1.0) {
                delay += ENGINE.get_delta_time();
            } else {
                audio_source.play(false);
                ++step;
                LOG.write("Audio source resumed\n");
            }
            break;

        case 4 :
            // step 6 - test stereo effect and looping sound
            if (audio_source.is_stopped()) {
                audio_source.set_position(source_position);
                audio_source.set_relative(true);
                ++step;
                LOG.write("Now test 3d sound\n");
                audio_source.play(true);
            }
            break;

        case 5 :
            // update source position
            angle += 30 * ENGINE.get_delta_time();
            if (angle > 360.0) {
                angle -= 360.0;
            }
            var rad = Bodhi.MathUtil.deg_to_rad(angle);
            source_position[0] =  RADIUS * Math.cos(rad);
            source_position[1] = -RADIUS * Math.sin(rad);
            audio_source.set_position(source_position);
            break;
    }

    SCENE.begin(Bodhi.RGBAColorf.GREEN());
    SCENE.end();

    if (INPUT.is_key_press(Bodhi.InputKeycode.ESCAPE)) {
        ENGINE.stop();
    }
}