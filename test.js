const Bodhi = imports.gi.Bodhi;

Bodhi.Log.set_output_file("log.log");
Bodhi.Log.set_truncate_output_file(false);
Bodhi.Log.set_writing_to_file(true);
Bodhi.Engine.start(1024, 768, true, false);

const WINDOW = Bodhi.Engine.get_window();
const SCENE = Bodhi.Engine.get_scene();
//const INPUT = Bodhi.Engine.get_input();

while (Bodhi.Engine.is_running()) {
    Bodhi.Engine.update();
    
    SCENE.beginf(0, 0, 0, 1);
    SCENE.end();

    WINDOW.set_title("Hello! FPS: " + Bodhi.Engine.get_fps());
    /*
    if (INPUT.is_key_down()) {
        print(INPUT.get_last_keycode())
        if (INPUT.is_key_pressed(Bodhi.InputKeycode.ESCAPE)) {
            print('Bye-bye');
            Bodhi.Engine.stop();
        }
    }*/
}
