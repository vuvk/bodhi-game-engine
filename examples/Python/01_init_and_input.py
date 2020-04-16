from gi.repository import Bodhi

Bodhi.Log.set_output_file("log.log")
Bodhi.Log.set_truncate_output_file(True)
Bodhi.Log.set_writing_to_file(True)

engine = Bodhi.Engine
engine.start(1024, 768, False, False)

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

    if (input.is_mouse_scroll_up()) :
        print("wow! wheel up!\n")
    
    if (input.is_mouse_scroll_down()) :
        print("wow! wheel down!\n")

    if (input.is_key_press(Bodhi.InputKeys.ESCAPE)) :
        print("Bye-bye.\n")
        engine.stop()