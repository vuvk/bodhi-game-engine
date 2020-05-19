from gi.repository import Bodhi

engine = Bodhi.Engine
engine.start(1024, 768, False, False)
# for enable logging to file you can set it after start engine
# or start engine with function "start_with_log"
log = engine.get_log();
log.set_write_to_file("log.log", False);
# test write to log
log.write("Hello!\n");
log.write_warning("Dangerous!\n");
log.write_error("Critical!\n");

window = engine.get_window()
window.set_title("Hello!")

scene = engine.get_scene()
input = engine.get_input()

engine.set_limit_fps(10)     

while (engine.is_running()) :
    engine.update()
    
    scene.begin(Bodhi.RGBAColorf.WHITE())
    scene.end()

    window.set_title("Hello! FPS: " + str(engine.get_fps()))

    if (input.is_mouse_wheel_up()) :
        log.write("wow! wheel up!\n")
    
    if (input.is_mouse_wheel_down()) :
        log.write("wow! wheel down!\n")

    if (input.is_key_press(Bodhi.InputKeycode.ESCAPE)) :
        log.write("Bye-bye.\n")
        engine.stop()
