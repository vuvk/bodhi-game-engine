//using SDL;
using GLFW;

namespace Bodhi {
    public class Input : Object {

        public enum States {
            NOT_CREATED,
            CREATED;
        }

		public enum Keys {
            /* The unknown key */
            UNKNOWN           = -1,
             
            /* Printable keys */
            SPACE             = 32,
            APOSTROPHE        = 39,  /* ' */
            COMMA             = 44,  /* , */
            MINUS             = 45,  /* - */
            PERIOD            = 46,  /* . */
            SLASH             = 47,  /* / */
            @0                = 48,
            @1                = 49,
            @2                = 50,
            @3                = 51,
            @4                = 52,
            @5                = 53,
            @6                = 54,
            @7                = 55,
            @8                = 56,
            @9                = 57,
            SEMICOLON         = 59, /* ; */
            EQUAL             = 61,  /* = */
            A                 = 65,
            B                 = 66,
            C                 = 67,
            D                 = 68,
            E                 = 69,
            F                 = 70,
            G                 = 71,
            H                 = 72,
            I                 = 73,
            J                 = 74,
            K                 = 75,
            L                 = 76,
            M                 = 77,
            N                 = 78,
            O                 = 79,
            P                 = 80,
            Q                 = 81,
            R                 = 82,
            S                 = 83,
            T                 = 84,
            U                 = 85,
            V                 = 86,
            W                 = 87,
            X                 = 88,
            Y                 = 89,
            Z                 = 90,
            LEFT_BRACKET      = 91, /* [ */
            BACKSLASH         = 92,  /* \ */
            RIGHT_BRACKET     = 93,  /* ] */
            GRAVE_ACCENT      = 96,  /* ` */
            WORLD_1           = 161, /* non-US #1 */
            WORLD_2           = 162, /* non-US #2 */
             
            /* Function keys */
            ESCAPE            = 256,
            ENTER             = 257,
            TAB               = 258,
            BACKSPACE         = 259,
            INSERT            = 260,
            DELETE            = 261,
            RIGHT             = 262,
            LEFT              = 263,
            DOWN              = 264,
            UP                = 265,
            PAGE_UP           = 266,
            PAGE_DOWN         = 267,
            HOME              = 268,
            END               = 269,
            CAPS_LOCK         = 280,
            SCROLL_LOCK       = 281,
            NUM_LOCK          = 282,
            PRINT_SCREEN      = 283,
            PAUSE             = 284,
            F1                = 290,
            F2                = 291,
            F3                = 292,
            F4                = 293,
            F5                = 294,
            F6                = 295,
            F7                = 296,
            F8                = 297,
            F9                = 298,
            F10               = 299,
            F11               = 300,
            F12               = 301,
            F13               = 302,
            F14               = 303,
            F15               = 304,
            F16               = 305,
            F17               = 306,
            F18               = 307,
            F19               = 308,
            F20               = 309,
            F21               = 310,
            F22               = 311,
            F23               = 312,
            F24               = 313,
            F25               = 314,
            KP_0              = 320,
            KP_1              = 321,
            KP_2              = 322,
            KP_3              = 323,
            KP_4              = 324,
            KP_5              = 325,
            KP_6              = 326,
            KP_7              = 327,
            KP_8              = 328,
            KP_9              = 329,
            KP_DECIMAL        = 330,
            KP_DIVIDE         = 331,
            KP_MULTIPLY       = 332,
            KP_SUBTRACT       = 333,
            KP_ADD            = 334,
            KP_ENTER          = 335,
            KP_EQUAL          = 336,
            LEFT_SHIFT        = 340,
            LEFT_CONTROL      = 341,
            LEFT_ALT          = 342,
            LEFT_SUPER        = 343,
            RIGHT_SHIFT       = 344,
            RIGHT_CONTROL     = 345,
            RIGHT_ALT         = 346,
            RIGHT_SUPER       = 347,
            MENU              = 348
        }
        
        private unowned GLFW.Window? glfw_window;
        private static double mouse_pos_x = 0;
        private static double mouse_pos_y = 0;
        private static double prev_mouse_pos_x = 0;
        private static double prev_mouse_pos_y = 0;

        private static double mouse_scroll_xoffset = 0; 
        private static double mouse_scroll_yoffset = 0;
        private static double prev_mouse_scroll_xoffset = 0; 
        private static double prev_mouse_scroll_yoffset = 0;
        private static bool mouse_hor_scrolling  = false;
        private static bool mouse_vert_scrolling = false;

        private static bool show_mouse_cursor = true;
        private States state = States.NOT_CREATED;

        internal Input() {
            if (!Engine.is_running()) {
                stderr.printf("I can't create input system if engine is not started!\n");
            } else {
                var window = Engine.get_window();
                glfw_window = window.get_glfw_window();

                glfw_window.set_scroll_callback(scroll_mouse_callback);

                state = States.CREATED;
            }
        }
        
        ~Input() {
        }

        /** Update state of input. Use this on every step! */
        internal void update() {

            prev_mouse_pos_x = mouse_pos_x;
            prev_mouse_pos_y = mouse_pos_y;
            
            mouse_hor_scrolling  = (prev_mouse_scroll_xoffset != mouse_scroll_xoffset);
            mouse_vert_scrolling = (prev_mouse_scroll_yoffset != mouse_scroll_yoffset);

            prev_mouse_scroll_xoffset = mouse_scroll_xoffset;
            prev_mouse_scroll_yoffset = mouse_scroll_yoffset;

            glfw_window.get_cursor_pos(out mouse_pos_x, out mouse_pos_y);
            //glfw_window.get_scroll_offset(out mouse_scroll_xoffset, out mouse_scroll_yoffset);
            
            GLFW.poll_events();

            if (mouse_hor_scrolling) {
                prev_mouse_scroll_xoffset = mouse_scroll_xoffset = 0;
            }
            if (mouse_vert_scrolling) {
                prev_mouse_scroll_yoffset = mouse_scroll_yoffset = 0;
            }
        }

        public States get_state() {
            return state;
        }

        /*----------*/
        /* KEYBOARD */
        /*----------*/
        /** Is any key down? */
        public bool is_key_press(Keys key) {
            return glfw_window.get_key((GLFW.Key)key) == GLFW.ButtonState.PRESS;
        }
        /** Is any key up? */
        public bool is_key_release(Keys key) {
            return glfw_window.get_key((GLFW.Key)key) == GLFW.ButtonState.RELEASE;        
        }
        /** Is this key pressed? */
        public bool is_key_repeat(Keys key) {
            return glfw_window.get_key((GLFW.Key)key) == GLFW.ButtonState.REPEAT;            
        }

        /*-------*/
        /* MOUSE */
        /*-------*/
        private static void scroll_mouse_callback(GLFW.Window window, double xoffset, double yoffset) {
            mouse_scroll_xoffset = xoffset;
            mouse_scroll_yoffset = yoffset;
        }
        /** mouse moving now? */
        public bool is_mouse_move() {
            return (prev_mouse_pos_x != mouse_pos_x) || 
                   (prev_mouse_pos_y != mouse_pos_y);
        }
        /** Is left mouse button down? */
        public bool is_mouse_left_press() {
            return glfw_window.get_mouse_button(GLFW.MouseButton.LEFT) == GLFW.ButtonState.PRESS;   
        }
        /** Is left mouse button up? */
        public bool is_mouse_left_release() {
            return glfw_window.get_mouse_button(GLFW.MouseButton.LEFT) == GLFW.ButtonState.RELEASE;   
        }
        /** Is left mouse button pressed? */
        public bool is_mouse_left_repeat() {
            return glfw_window.get_mouse_button(GLFW.MouseButton.LEFT) == GLFW.ButtonState.REPEAT;   
        }

        /** Is right mouse button down? */
        public bool is_mouse_right_press() {
            return glfw_window.get_mouse_button(GLFW.MouseButton.RIGHT) == GLFW.ButtonState.PRESS;   
        }
        /** Is right mouse button up? */
        public bool is_mouse_right_release() {
            return glfw_window.get_mouse_button(GLFW.MouseButton.RIGHT) == GLFW.ButtonState.RELEASE;   
        }
        /** Is right mouse button pressed? */
        public bool is_mouse_right_repeat() {
            return glfw_window.get_mouse_button(GLFW.MouseButton.RIGHT) == GLFW.ButtonState.REPEAT;   
        }

        /** Is middle mouse button down? */
        public bool is_mouse_middle_press() {
            return glfw_window.get_mouse_button(GLFW.MouseButton.MIDDLE) == GLFW.ButtonState.PRESS;   
        }
        /** Is middle mouse button up? */
        public bool is_mouse_middle_release() {
            return glfw_window.get_mouse_button(GLFW.MouseButton.MIDDLE) == GLFW.ButtonState.RELEASE;   
        }
        /** Is middle mouse button pressed? */
        public bool is_mouse_middle_repeat() {
            return glfw_window.get_mouse_button(GLFW.MouseButton.MIDDLE) == GLFW.ButtonState.REPEAT;   
        }

        /** get cursor showing */
        public bool is_mouse_cursor_showing() {
            return show_mouse_cursor;
        }
        /** get mouse position */
        public Vector2f get_mouse_pos() {
            return { (float) mouse_pos_x, (float) mouse_pos_y };
        }
        public void get_mouse_posf(out float x, out float y) {
            x = (float) mouse_pos_x;
            y = (float) mouse_pos_y;
        }
        public float get_mouse_pos_x() {
            return (float) mouse_pos_x;            
        }
        public float get_mouse_pos_y() {
            return (float) mouse_pos_y;   
        }
        /** Is mouse wheel? */
        public bool is_mouse_scroll() {
            return mouse_hor_scrolling || mouse_vert_scrolling;
        }
        /** Is mouse horizontal wheel? */
        public bool is_mouse_hor_scroll() {
            return mouse_hor_scrolling;
        }
        /** Is mouse vertical wheel? */
        public bool is_mouse_vert_scroll() {
            return mouse_vert_scrolling;
        }
        /** get mouse wheel direction */
        public float get_mouse_vert_scroll() {
            return (float) mouse_scroll_yoffset;            
        }
        public bool is_mouse_scroll_left() {
            return mouse_scroll_xoffset < 0;  
        }
        public bool is_mouse_scroll_right() {
            return mouse_scroll_yoffset > 0; 
        }
        public bool is_mouse_scroll_up() {
            return mouse_scroll_yoffset > 0;  
        }
        public bool is_mouse_scroll_down() {
            return mouse_scroll_yoffset < 0; 
        }

        /** set cursor showing */
        public void set_mouse_cursor_showing(bool show) {
            show_mouse_cursor = show;
            GLFW.WindowHint.CURSOR_HIDDEN.set_bool(show);
        }
        /** set mouse position */
        public void set_mouse_pos(Vector2f pos) {
            set_mouse_posf(pos.x, pos.y);
        }
        public void set_mouse_posf(float x, float y) {
            glfw_window.set_cursor_pos(x, y);
        }
        public void set_mouse_pos_x(float x) {
            set_mouse_posf(x, (float)mouse_pos_y);
        }
        public void set_mouse_pos_y(float y) {
            set_mouse_posf((float)mouse_pos_x, y);            
        }
    }
}