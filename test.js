const Bodhi = imports.gi.Bodhi;

Bodhi.Engine.start(1024, 768, true, false);

const WINDOW = Bodhi.Engine.get_window();
const SCENE = Bodhi.Engine.get_scene();
const CLEAR_COLOR = new Bodhi.RGBAColorf();
CLEAR_COLOR.set_rgba(1, 0, 0, 1);

while (true) {
    Bodhi.Engine.update();
    
    SCENE.begin(CLEAR_COLOR);
    SCENE.end();

    WINDOW.set_title('Hello, JS! FPS: ' + Bodhi.Engine.get_fps());
}

