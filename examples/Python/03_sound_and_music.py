import math
from gi.repository import Bodhi

engine = Bodhi.Engine
fs = Bodhi.FileSystem
engine.start(512, 10, False, False)

window = engine.get_window()
window.set_title("OpenAL test")

log = engine.get_log()
scene = engine.get_scene()
input = engine.get_input()
audio = engine.get_audio()

step = 0
source_position = Bodhi.Vector3f()
source_position.set_xyz(0, 0, -1)
angle = 0.0
RADIUS = 1.5

fs.mount("examples/assets.7z", "", True)

audio_file_precaching = audio.open_audio_file("vase3.wav", True )
audio_file_streaming  = audio.open_audio_file("vase3.wav", False)

audio_source = audio.new_audio_source()

# step 1 - play precached sound
audio_source.set_audio_file(audio_file_precaching)
audio_source.play(False)
log.write("Now test playing precached audio file\n")

delay = 0;

while engine.is_running() :
    engine.update()

    scene.begin(Bodhi.RGBAColorf.WHITE())
    scene.end()

    if step == 0 :
        if audio_source.is_stopped() :
            # step 2 - play streaming sound
            audio_source.set_audio_file(audio_file_streaming)
            audio_source.play(False)
            step += 1
            log.write("Now test playing streamed audio file\n")

    elif step == 1 :
        if audio_source.is_stopped() :
            # step 3 - play streaming sound and pause
            audio_source.play(False)
            step += 1
            log.write("Now test playing streamed audio file with pause\n")

    elif step == 2 :
        # step 4 - pause
        if delay < 1.0 :
            delay = delay + engine.get_delta_time()
        else :
            audio_source.pause()
            step += 1
            delay = 0.0
            log.write("Audio source paused\n")

    elif step == 3 :
        # step 5 - resume
        if delay < 1.0 :
            delay = delay + engine.get_delta_time()
        else :
            audio_source.play(False)
            step += 1
            log.write("Audio source resumed\n")

    elif step == 4 :
        # step 6 - test stereo effect and looping sound
        if audio_source.is_stopped() :
            audio_source.set_positionv(source_position)
            audio_source.set_relative(True)
            step += 1
            log.write("Now test 3d sound\n")
            audio_source.play(True)

    elif step == 5 :
        # update source position
        angle += 30 * engine.get_delta_time()
        if angle > 360.0 :
            angle -= 360.0
        rad = math.radians(angle)
        source_position.x =  RADIUS * math.cos(rad)
        source_position.z = -RADIUS * math.sin(rad)
        audio_source.set_positionf(source_position.get_x(), source_position.get_y(), source_position.get_z())

    if (input.is_key_press(Bodhi.InputKeys.ESCAPE)) :
        log.write("Bye-bye.\n")
        engine.stop()
