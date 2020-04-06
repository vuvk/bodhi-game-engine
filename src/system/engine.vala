using SDL;

namespace Bodhi {

    public class Engine : Object {
        
        /** state of engine */
        public enum States {
            NOT_RUNNING,
            RUNNING
        }

        private const string NAME    = "bodhi Game Engine";
        private const string VERSION = "0.1";
        
        private static States state = States.NOT_RUNNING;
        
        private static uint64 curr_tick;
        private static uint64 last_tick;
        
        // delta of time between last and current frame
        private static float delta_time;
        // frames per seconds
        private static uint fps;
        // count of frames before fps_delay
        private static uint frames_count;
        // time before we calculate FPS
        private static float fps_delay;
        // limit of frames per seconds
        private static uint16 limit_fps;
        private static float framerate;

        private static unowned RendererWindow window;
        private static unowned Renderer renderer;
        private static Scene scene;
        private static unowned Input input;
    
        /** start Antoshka Engine and initialize all subsystems */
        public static int start (int wnd_width, int wnd_height, bool resizable, bool fullscreen_mode) {
            /* what do you want, if engine is already started? */
            if (state == States.RUNNING) {
                Log.write_warning("Engine is already started!\n");
                return Errors.NO_ERROR;
            }
        
            Log.write_message( "============================================\n" + 
                              @"$NAME ver. $VERSION\n" + 
                               "============================================\n");
        
            /* try to init SDL2 */
            if (SDL.init_subsystem(SDL.InitFlag.VIDEO) < 0) {
                Log.write_error("Couldn't init SDL2! Error: " + SDL.get_error() + "\n");
                return Errors.ENGINE_NOT_CREATED;
            }
        
            /* now engine is running */
            state = States.RUNNING;
        
            /* try to create window */
            window = RendererWindow.get_instance(wnd_width, wnd_height, resizable, fullscreen_mode);
            if (window == null) {
                Log.write_error("Renderer window not created!\n");
                stop();
                return Errors.WINDOW_NOT_CREATED;
            }
        
            /* try to create OpenGL context */
            renderer = Renderer.get_instance(); 
            if (renderer == null) {
                Log.write_error("Renderer not created!\n");
                stop();
                return Errors.RENDERER_NOT_CREATED;
            }
            /* show info about system */
            renderer.print_display_modes();
            renderer.print_info();
        
            Log.write_message("Engine started!\n");
        
            /* timing */
            curr_tick = SDL.Timer.get_ticks();
            last_tick = curr_tick;
        
            delta_time = 0.0f;
            fps = 0;
            fps_delay = 0.0f;
            limit_fps = 0;
            framerate = 0.0f;
        
            /* initialize input system */
            //InputClearTableOfPressedKeys();
        
            /* initialize resource manager */
            //RM_Init();
        
            /* initialize containers */
            /* resources */
            //_textures  = DictionaryCreate();
            //_materials = DictionaryCreate();
            /* 2d */
            //_images    = DictionaryCreate();
            //_fonts     = DictionaryCreate();
            //_texts     = DictionaryCreate();
            //_nodes2d   = ListCreate();
            /* 3d */
            //_meshesMd2 = DictionaryCreate();
            //_nodesMd2  = ListCreate();

            scene = new Scene();
            input = Input.get_instance();
        
            return Errors.NO_ERROR;
        }

        /** stop Antoshka Engine */
        public static void stop() {
            scene.dispose();
            scene = null;

            input.dispose();
            input = null;

            window.dispose();
            window = null;
        
            /* clear resources */
            /*TexturesDestroyAll();
            MaterialsDestroyAll();
            ImagesDestroyAll();
            FontsDestroyAll();
            TextsDestroyAll();
            Nodes2DDestroyAll();
            MeshesMd2DestroyAll();
            NodesMd2DestroyAll();*/
        
            /* delete containers */
            /*DictionaryDestroy(&_textures);
            DictionaryDestroy(&_materials);
            DictionaryDestroy(&_images);
            DictionaryDestroy(&_fonts);
            DictionaryDestroy(&_texts);
            ListDestroy(&_nodes2d);
        
            DictionaryDestroy(&_meshesMd2);
            ListDestroy(&_nodesMd2);*/
            
            SDL.quit();        
            state = States.NOT_RUNNING;
        
            Log.write_warning("Engine stopped!\n");
        }
        
        private static void update_time() {
            // calculate deltaTime
            curr_tick = SDL.Timer.get_ticks();
            if (curr_tick > last_tick) {
                delta_time = (curr_tick - last_tick) * 0.001f;
                last_tick  =  curr_tick;
            }
        }

        private static void update_fps() {
            // если установлено ограничение FPS
            if (limit_fps > 0.0f) {
                int delay = (int)Math.floor(framerate - delta_time);
                if (delay <= 0) {
                    delay = 1;
                }
                // пропускаем разницу
                SDL.Timer.delay(delay);
            } else {
                SDL.Timer.delay(1);
            }
        
            // fps узнаем раз в полсекунды
            if (fps_delay < 0.5f) {
                // считаем количество кадров
                ++frames_count;
                // накапливаем задержку
                fps_delay += delta_time;
            } else {
                // фпс = секунда деленная на прошедшее время, деленное на количество кадров ))
                fps = (uint16)(1.0f / (fps_delay / frames_count));
                fps_delay -= 0.5f;
                frames_count = 0;
            }
        }

        public static void update() {
            update_time();
            update_fps();

            window.update();
            //input.update();
        }

        public static bool is_running() {
            return state == States.RUNNING;
        }

        public static uint16 get_limit_fps() {
            return limit_fps;
        }

        public static uint get_fps() {
            return fps;
        }

        public static float get_delta_time() {
            return delta_time;
        }
        
        // system
        public static States get_state() {
            return state;
        }
        
        public static string get_name() {
            return NAME;
        }

        public static string get_version() {
            return VERSION;
        }

        public static unowned RendererWindow get_window() {
            return window;
        }

        public static unowned Renderer get_renderer() {
            return renderer;
        }

        public static unowned Scene? get_scene() {
            return scene;
        }

        public static unowned Input? get_input() {
            return input;
        }
        
        // timing
        public static void set_limit_fps (uint16 limit) {
            limit_fps = limit;
            framerate = 1000.0f / limit;
        }
    }    
}