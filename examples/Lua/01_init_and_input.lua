-- sudo apt-get install lua5.1 luarocks
-- luarocks install lgi

require 'luarocks/loader'
Bodhi = require('lgi').Bodhi

engine = Bodhi.Engine
engine.start(800,600,false,false)

-- for enable logging to file you can set it after start engine
-- or start engine with function "start_with_log"
log = engine.get_log()
log:set_write_to_file("log.log", false)
-- test write to log
log:write("Hello!\n")
log:write_warning("Dangerous!\n")
log:write_error("Critical!\n")

window = engine.get_window()
window:set_title("Hello!")

scene = engine.get_scene()
input = engine.get_input()

engine.set_limit_fps(10)

while (engine.is_running()) do
    engine.update()

    scene:begin_draw(Bodhi.RGBAColorf.WHITE())
    scene:end_draw()

    window:set_title("Hello! FPS: " .. tostring(engine:get_fps()))

    if (input:is_mouse_scroll_up()) then
        log:write("wow! wheel up!\n")
    end

    if (input:is_mouse_scroll_down()) then
        log:write("wow! wheel down!\n")
    end

    if (input:is_key_press(Bodhi.InputKeys.ESCAPE)) then
        log:write("Bye-bye.\n")
        engine.stop()
    end
end
