const Bodhi = imports.gi.Bodhi;

Bodhi.Log.set_output_file("log.log");
Bodhi.Log.set_truncate_output_file(false);
Bodhi.Log.set_writing_to_file(true);
Bodhi.Engine.start(1024, 768, true, false);

const WINDOW = Bodhi.Engine.get_window();
const SCENE = Bodhi.Engine.get_scene();
const INPUT = Bodhi.Engine.get_input();

Bodhi.Engine.set_limit_fps(10);    

while (Bodhi.Engine.is_running()) {
    Bodhi.Engine.update();
    
    SCENE.beginf(1,0,1,1);
    SCENE.end();

    WINDOW.set_title("Hello! FPS: " + Bodhi.Engine.get_fps());

    if (INPUT.is_mouse_scroll_up()) {
        print("wow! wheel up!");
    }
    if (INPUT.is_mouse_scroll_down()) {
        print("wow! wheel down!");
    }

    if (INPUT.is_key_press(Bodhi.InputKeys.ESCAPE)) {
        print("Bye-bye.");
        Bodhi.Engine.stop();
    }
}
