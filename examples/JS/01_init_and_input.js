const Bodhi = imports.gi.Bodhi;

Bodhi.Engine.start(1024, 768, true, false);
// for enable logging to file you can set it after start engine
// or start engine with function "start_with_log"
const LOG = Bodhi.Engine.get_log();
LOG.set_write_to_file("log.log", false);
// test write to log
LOG.write("Hello!\n");
LOG.write_warning("Dangerous!\n");
LOG.write_error("Critical!\n");

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
        LOG.write("wow! wheel up!\n");
    }
    if (INPUT.is_mouse_scroll_down()) {
        LOG.write("wow! wheel down!\n");
    }

    if (INPUT.is_key_press(Bodhi.InputKeys.ESCAPE)) {
        LOG.write("Bye-bye.\n");
        Bodhi.Engine.stop();
    }
}
