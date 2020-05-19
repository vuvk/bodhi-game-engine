//using SDL;
//using GLFW;

namespace Bodhi {
    public class Input : SubSystem {

        public enum Keycode {
            UNKNOWN   = SDL.Input.Keycode.UNKNOWN, 
            RETURN    = SDL.Input.Keycode.RETURN, 
            ESCAPE    = SDL.Input.Keycode.ESCAPE, 
            BACKSPACE = SDL.Input.Keycode.BACKSPACE, 
            TAB		  = SDL.Input.Keycode.TAB, 
            SPACE     = SDL.Input.Keycode.SPACE, 
            EXCLAIM   = SDL.Input.Keycode.EXCLAIM,
			QUOTEDBL, HASH, PERCENT, DOLLAR, AMPERSAND, QUOTE,
			LEFTPAREN, RIGHTPAREN, ASTERISK, PLUS, COMMA, MINUS,
			PERIOD, SLASH, SDLK_0, SDLK_1, SDLK_2, SDLK_3, SDLK_4,
			SDLK_5, SDLK_6, SDLK_7, SDLK_8, SDLK_9, COLON, SEMICOLON,
			LESS, EQUALS, GREATER, QUESTION, AT, LEFTBRACKET, BACKSLASH,
			RIGHTBRACKET, CARET, UNDERSCORE, BACKQUOTE, a, b, c, d, e, f,
			g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, CAPSLOCK, F1,
			F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, PRINTSCREEN,
			SCROLLLOCK, PAUSE, INSERT, HOME, PAGEUP, DELETE, END,
			PAGEDOWN, RIGHT, LEFT, DOWN, UP, NUMLOCKCLEAR, KP_DIVIDE,
			KP_MULTIPLY, KP_MINUS, KP_PLUS, KP_ENTER, KP_1, KP_2, KP_3,
			KP_4, KP_5, KP_6, KP_7, KP_8, KP_9, KP_0, KP_PERIOD, APPLICATION,
			POWER, KP_EQUALS, F13, F14, F15, F16, F17, F18, F19, F20, F21,
			F22, F23, F24, EXECUTE, HELP, MENU, SELECT, STOP, AGAIN, UNDO,
			CUT, COPY, PASTE, FIND, MUTE, VOLUMEUP, VOLUMEDOWN, KP_COMMA,
			KP_EQUALSAS400, ALTERASE, SYSREQ, CANCEL, CLEAR, PRIOR,
			RETURN2, SEPARATOR, OUT, OPER, CLEARAGAIN, CRSEL, EXSEL,
			KP_00, KP_000, THOUSANDSSEPARATOR, DECIMALSEPARATOR,
			CURRENCYUNIT, CURRENCYSUBUNIT, KP_LEFTPAREN, KP_RIGHTPAREN,
			KP_LEFTBRACE, KP_RIGHTBRACE, KP_TAB, KP_BACKSPACE, KP_A, KP_B,
			KP_C, KP_D, KP_E, KP_F, KP_XOR, KP_POWER, KP_PERCENT, KP_LESS,
			KP_GREATER, KP_AMPERSAND, KP_DBLAMPERSAND, KP_VERTICALBAR,
			KP_DBLVERTICALBAR, KP_COLON, KP_HASH, KP_SPACE, KP_AT,
			KP_EXCLAM, KP_MEMSTORE, KP_MEMRECALL, KP_MEMCLEAR, KP_MEMADD,
			KP_MEMSUBTRACT, KP_MEMMULTIPLY, KP_MEMDIVIDE, KP_PLUSMINUS,
			KP_CLEAR, KP_CLEARENTRY, KP_BINARY, KP_OCTAL, KP_DECIMAL,
			KP_HEXADECIMAL, LCTRL, LSHIFT, LALT, LGUI, RCTRL, RSHIFT, RALT,
			RGUI, MODE, AUDIONEXT, AUDIOPREV, AUDIOSTOP, AUDIOPLAY,
			AUDIOMUTE, MEDIASELECT, WWW, MAIL, CALCULATOR, COMPUTER,
			AC_SEARCH, AC_HOME, AC_BACK, AC_FORWARD, AC_STOP, AC_REFRESH,
			AC_BOOKMARKS, BRIGHTNESSDOWN, BRIGHTNESSUP, DISPLAYSWITCH,
			KBDILLUMTOGGLE, KBDILLUMDOWN, KBDILLUMUP, EJECT, SLEEP
        }
        
        public enum Scancode {
			UNKNOWN, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R,
			S, T, U, V, W, X, Y, Z,
			SDL_SCANCODE_1, SDL_SCANCODE_2,
			SDL_SCANCODE_3, SDL_SCANCODE_4, SDL_SCANCODE_5,
			SDL_SCANCODE_6, SDL_SCANCODE_7, SDL_SCANCODE_8,
			SDL_SCANCODE_9, SDL_SCANCODE_0,
			RETURN, ESCAPE, BACKSPACE, TAB, SPACE, MINUS, EQUALS,
			LEFTBRACKET, RIGHTBRACKET, BACKSLASH, NONUSHASH,
			SEMICOLON, APOSTROPHE, GRAVE, COMMA, PERIOD, SLASH,
			CAPSLOCK, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12,
			PRINTSCREEN, SCROLLLOCK, PAUSE, INSERT, HOME,
			PAGEUP, DELETE, END, PAGEDOWN, RIGHT, LEFT, DOWN, UP,
			NUMLOCKCLEAR, KP_DIVIDE, KP_MULTIPLY, KP_MINUS, KP_PLUS,
			KP_ENTER, KP_1, KP_2, KP_3, KP_4, KP_5, KP_6, KP_7, KP_8,
			KP_9, KP_0, KP_PERIOD, NONUSBACKSLASH, APPLICATION,
			POWER, KP_EQUALS, F13, F14, F15, F16, F17, F18, F19, F20,
			F21, F22, F23, F24, EXECUTE, HELP, MENU, SELECT, STOP,
			AGAIN, UNDO, CUT, COPY, PASTE, FIND, MUTE, VOLUMEUP,
			VOLUMEDOWN, LOCKINGCAPSLOCK, LOCKINGNUMLOCK,
			LOCKINGSCROLLLOCK, KP_COMMA, KP_EQUALSAS400,
			INTERNATIONAL1, INTERNATIONAL2, INTERNATIONAL3,
			INTERNATIONAL4, INTERNATIONAL5, INTERNATIONAL6,
			INTERNATIONAL7, INTERNATIONAL8, INTERNATIONAL9, LANG1,
			LANG2, LANG3, LANG4, LANG5, LANG6, LANG7, LANG8,
			LANG9, ALTERASE, SYSREQ, CANCEL, CLEAR, PRIOR, RETURN2,
			SEPARATOR, OUT, OPER, CLEARAGAIN, CRSEL, EXSEL, KP_00,
			KP_000, THOUSANDSSEPARATOR, DECIMALSEPARATOR,
			CURRENCYUNIT, CURRENCYSUBUNIT, KP_LEFTPAREN,
			KP_RIGHTPAREN, KP_LEFTBRACE, KP_RIGHTBRACE, KP_TAB,
			KP_BACKSPACE, KP_A, KP_B, KP_C, KP_D, KP_E, KP_F, KP_XOR,
			KP_POWER, KP_PERCENT, KP_LESS, KP_GREATER, KP_AMPERSAND,
			KP_DBLAMPERSAND, KP_VERTICALBAR, KP_DBLVERTICALBAR,
			KP_COLON, KP_HASH, KP_SPACE, KP_AT, KP_EXCLAM, KP_MEMSTORE,
			KP_MEMRECALL, KP_MEMCLEAR, KP_MEMADD, KP_MEMSUBTRACT,
			KP_MEMMULTIPLY, KP_MEMDIVIDE, KP_PLUSMINUS, KP_CLEAR,
			KP_CLEARENTRY, KP_BINARY, KP_OCTAL, KP_DECIMAL,
			KP_HEXADECIMAL, LCTRL, LSHIFT, LALT, LGUI, RCTRL, RSHIFT, RALT,
			RGUI, MODE, AUDIONEXT, AUDIOPREV, AUDIOSTOP, AUDIOPLAY,
			AUDIOMUTE, MEDIASELECT, WWW, MAIL, CALCULATOR, COMPUTER,
			AC_SEARCH, AC_HOME, AC_BACK, AC_FORWARD, AC_STOP, AC_REFRESH,
			AC_BOOKMARKS, BRIGHTNESSDOWN, BRIGHTNESSUP, DISPLAYSWITCH,
			KBDILLUMTOGGLE, KBDILLUMDOWN, KBDILLUMUP, EJECT, SLEEP, APP1, APP2
		}

        private SDL.Event event;

        /* keyboard state */
        private const int KEYBOARD_KEY_DOWN = (1 << 0);
        private const int KEYBOARD_KEY_UP   = (1 << 1);
        private uint8 keyboard_state = 0;
        private Keycode  last_keycode  = Keycode.UNKNOWN;
        private Scancode last_scancode = Scancode.UNKNOWN;
        // see http://wiki.libsdl.org/SDLScancodeLookup for details
        private const int MAX_KEY_TABLE_SIZE = 512;
        /* table of pressed keys */
        /* таблица из нажатых в данный момент кнопок */
        private bool[] key_pressed = new bool[MAX_KEY_TABLE_SIZE];

        /* mouse state */
        private const uint16 MOUSE_MOVE        = (1 << 0);
        private const uint16 MOUSE_BUTTON_UP   = (1 << 1);    /* any button was unpressed */
        private const uint16 MOUSE_BUTTON_DOWN = (1 << 2);    /* any button was pressed */
        private const uint16 MOUSE_WHEEL       = (1 << 3);
        private const uint16 MOUSE_LAST_LEFT   = (1 << 4);    /* last pressed mouse button - left   */
        private const uint16 MOUSE_LAST_RIGHT  = (1 << 5);    /* last pressed mouse button - right  */
        private const uint16 MOUSE_LAST_MIDDLE = (1 << 6);    /* last pressed mouse button - middle */
        private const uint16 MOUSE_HELD_LEFT   = (1 << 7);    /* left button is held down   */
        private const uint16 MOUSE_HELD_RIGHT  = (1 << 8);    /* right button is held down  */
        private const uint16 MOUSE_HELD_MIDDLE = (1 << 9);    /* middle button is held down */
        private Vector2i mouse_position;
        private int mouse_wheel_direction = 0;
        private uint16 mouse_state = 0;
        private bool show_mouse_cursor = true;

        internal Input() {
            base();
            subsystem_name = "Input System";
        }

        ~Input() {
            deinit();
        }

        protected override Errors init() {
            if (!Engine.is_running()) {
                stderr.printf("I can't create input system if engine is not started!\n");
                return Errors.ENGINE_NOT_STARTED;
            } else {
                return Errors.NO_ERROR;
            }
        }
        
        
        /** Clear table of pressed keys */
        private void clear_states() {            
            /* drop keyboard state */
            keyboard_state = 0;
            last_keycode = Keycode.UNKNOWN;

            /* clear mouse state */
            //mouse_state = 0;
            if ((mouse_state & MOUSE_MOVE) != 0)
                mouse_state &= ~MOUSE_MOVE;

            if ((mouse_state & MOUSE_BUTTON_UP) != 0)
                mouse_state &= ~MOUSE_BUTTON_UP;

            if ((mouse_state & MOUSE_BUTTON_DOWN) != 0)
                mouse_state &= ~MOUSE_BUTTON_DOWN;

            if ((mouse_state & MOUSE_WHEEL) != 0)
                mouse_state &= ~MOUSE_WHEEL;

            if ((mouse_state & MOUSE_LAST_LEFT) != 0)
                mouse_state &= ~MOUSE_LAST_LEFT;

            if ((mouse_state & MOUSE_LAST_RIGHT) != 0)
                mouse_state &= ~MOUSE_LAST_RIGHT;

            if ((mouse_state & MOUSE_LAST_MIDDLE) != 0)
                mouse_state &= ~MOUSE_LAST_MIDDLE;

            mouse_wheel_direction = 0;

            //Memory.set(&key_pressed, 0, MAX_KEY_TABLE_SIZE * sizeof(bool));
            for (int i = 0; i < key_pressed.length; ++i) {
                key_pressed[i] = false;
            }
        }

        /** Update state of input. Use this on every step! */
        internal void update() {
            if (!is_initialized()) {
                return;
            }
            
            clear_states();

            /* if exists any event */
            while (SDL.Event.poll(out event) == 1) {
                /* save keyboard state */
                if (event.type == SDL.EventType.KEYDOWN || event.type == SDL.EventType.KEYUP) {
                    last_keycode  = (Keycode)event.key.keysym.sym;
                    last_scancode = (Scancode)event.key.keysym.scancode;

                    /* mark key as pressed if key is down... and as not pressed if key is up */
                    key_pressed[last_scancode] = (event.type == SDL.EventType.KEYDOWN);
                }

                if (event.type == SDL.EventType.KEYDOWN) {
                    keyboard_state |= KEYBOARD_KEY_DOWN;
                }

                if (event.type == SDL.EventType.KEYUP) {
                    keyboard_state |= KEYBOARD_KEY_UP;
                }


                /* save mouse state */
                if (event.type == SDL.EventType.MOUSEMOTION) {
                    mouse_state |= MOUSE_MOVE;
                }

                if (event.type == SDL.EventType.MOUSEWHEEL) {
                    mouse_state |= MOUSE_WHEEL;
                    mouse_wheel_direction = event.wheel.y;
                }

                if ((mouse_state & MOUSE_MOVE) != 0) {
                    int x = 0, 
                        y = 0;
                    SDL.Input.Cursor.get_state(ref x, ref y);
                    mouse_position.set_xy(x, y);
                }

                if (event.type == SDL.EventType.MOUSEBUTTONDOWN) {
                    mouse_state &= ~MOUSE_BUTTON_UP;
                    mouse_state |=  MOUSE_BUTTON_DOWN;
                }

                if (event.type == SDL.EventType.MOUSEBUTTONUP) {
                    mouse_state &= ~MOUSE_BUTTON_DOWN;
                    mouse_state |=  MOUSE_BUTTON_UP;
                }

                if (event.button.button == SDL.Input.MouseButton.LEFT) {
                    mouse_state |= MOUSE_LAST_LEFT;

                    /* удержание кнопки */
                    if ((mouse_state & MOUSE_BUTTON_DOWN) != 0)
                        mouse_state |= MOUSE_HELD_LEFT;
                    if ((mouse_state & MOUSE_BUTTON_UP) != 0)
                        mouse_state &= ~MOUSE_HELD_LEFT;
                }

                if (event.button.button == SDL.Input.MouseButton.RIGHT) {
                    mouse_state |= MOUSE_LAST_RIGHT;

                    /* удержание кнопки */
                    if ((mouse_state & MOUSE_BUTTON_DOWN) != 0)
                        mouse_state |= MOUSE_HELD_RIGHT;
                    if ((mouse_state & MOUSE_BUTTON_UP) != 0)
                        mouse_state &= ~MOUSE_HELD_RIGHT;
                }

                if (event.button.button == SDL.Input.MouseButton.MIDDLE) {
                    mouse_state |= MOUSE_LAST_MIDDLE;

                    /* удержание кнопки */
                    if ((mouse_state & MOUSE_BUTTON_DOWN) != 0)
                        mouse_state |= MOUSE_HELD_MIDDLE;
                    if ((mouse_state & MOUSE_BUTTON_UP) != 0)
                        mouse_state &= ~MOUSE_HELD_MIDDLE;
                }
            }
        }

        /*----------*/
        /* KEYBOARD */
        /*----------*/
        /** Is any key down? */
        public bool is_key_down() {
            if (!is_initialized()) {
                return false;
            }
            return (keyboard_state & KEYBOARD_KEY_DOWN) != 0;
        }
        /** Is any key up? */
        public bool is_key_up() {
            if (!is_initialized()) {
                return false;
            }
            return (keyboard_state & KEYBOARD_KEY_UP) != 0;            
        }
        /** Is key press? */
        public bool is_key_press(Keycode keycode) {
            if (!is_initialized()) {
                return false;
            }
            return key_pressed[SDL.Input.Keyboard.scancode_fromkey((SDL.Input.Keycode)keycode)];   
        }

        /** Is any key up? */
        /*public bool is_key_release(Keys key) {
            if (!is_initialized()) {
                return false;
            }

            return glfw_window.get_key((GLFW.Key)key) == GLFW.ButtonState.RELEASE;
        }*/

        /** Is this key pressed? */
        /*public bool is_key_repeat(Keys key) {
            if (!is_initialized()) {
                return false;
            }

            return glfw_window.get_key((GLFW.Key)key) == GLFW.ButtonState.REPEAT;
        }*/
        /** Return code of last pressed key */
        public Keycode get_last_keycode() {
            if (!is_initialized()) {
                return Keycode.UNKNOWN;
            }
            return last_keycode;
        }
        /** Return code of last pressed key */
        public Scancode get_last_scancode() {
            if (!is_initialized()) {
                return Scancode.UNKNOWN;
            }
            return last_scancode;
        }

        /*-------*/
        /* MOUSE */
        /*-------*/
        /** mouse moving now? */
        public bool is_mouse_move() {
            if (!is_initialized()) {
                return false;
            }
            return (mouse_state & MOUSE_MOVE) != 0;
        }
        /** Is any mouse button down? */
        public bool is_mouse_button_down() {
            if (!is_initialized()) {
                return false;
            }
            return (mouse_state & MOUSE_BUTTON_DOWN) != 0;
        }
        /** Is any mouse button up? */
        public bool is_mouse_button_up() {
            if (!is_initialized()) {
                return false;
            }
            return (mouse_state & MOUSE_BUTTON_UP) != 0;
        }
        /** get cursor showing */
        public bool is_mouse_cursor_showing() {
            if (!is_initialized()) {
                return false;
            }
            return SDL.Input.Cursor.show(-1) != 0;
        }
        /** get mouse position */
        public Vector2i get_mouse_pos() {
            if (!is_initialized()) {
                return Vector2i.ZERO();
            }
            return mouse_position;
        }
        public int get_mouse_pos_x() {
            if (!is_initialized()) {
                return 0;
            }
            return mouse_position.x;            
        }
        public int get_mouse_pos_y() {
            if (!is_initialized()) {
                return 0;
            }
            return mouse_position.y;   
        }
        /** Is mouse wheel? */
        public bool is_mouse_wheel() {
            if (!is_initialized()) {
                return false;
            }
            return (mouse_state & MOUSE_WHEEL) != 0;
        }
        /** get mouse wheel direction */
        public int get_mouse_wheel_dir() {
            if (!is_initialized()) {
                return 0;
            }
            return mouse_wheel_direction;            
        }
        public bool is_mouse_wheel_up() {
            if (!is_initialized()) {
                return false;
            }
            return mouse_wheel_direction > 0;  
        }
        public bool is_mouse_wheel_down() {
            if (!is_initialized()) {
                return false;
            }
            return mouse_wheel_direction < 0; 
        }

        /** set cursor showing */
        public void set_mouse_cursor_showing(bool show) {
            if (!is_initialized()) {
                return;
            }
            SDL.Input.Cursor.show(show ? 1 : 0);
        }
        /** set mouse position */
        public void set_mouse_position(Vector2i pos) {
            set_mouse_positioni(pos.x, pos.y);
        }
        public void set_mouse_positioni(int x, int y) {
            if (!is_initialized()) {
                return;
            }
            var window = Engine.get_window();
            if (window != null) {
                mouse_position.set_xy(x, y);
                unowned SDL.Video.Window? sdl_window = window.get_sdl_window();
				if (sdl_window != null) {
					SDL.Input.Cursor.warp_inwindow(sdl_window, x, y); 
				}
            }           
        }
        public void set_mouse_position_x(int x) {
            set_mouse_positioni(x, mouse_position.y);
        }
        public void set_mouse_position_y(int y) {
            set_mouse_positioni(mouse_position.x, y);            
        }
        /* get mouse button state */
        /** get last pressed button */
        public bool is_mouse_left_clicked() {
            if (!is_initialized()) {
                return false;
            }
            return (mouse_state & MOUSE_LAST_LEFT) != 0;
        }
        public bool is_mouse_right_clicked() {
            if (!is_initialized()) {
                return false;
            }
            return (mouse_state & MOUSE_LAST_RIGHT) != 0;
        }
        public bool is_mouse_middle_clicked() {
            if (!is_initialized()) {
                return false;
            }
            return (mouse_state & MOUSE_LAST_MIDDLE) != 0;
        }
        /** what button is held down */
        public bool is_mouse_left_held() {
            if (!is_initialized()) {
                return false;
            }
            return (mouse_state & MOUSE_HELD_LEFT) != 0;
        }
        public bool is_mouse_right_held() {
            if (!is_initialized()) {
                return false;
            }
            return (mouse_state & MOUSE_HELD_RIGHT) != 0;
        }
        public bool is_mouse_middle_held() {
            if (!is_initialized()) {
                return false;
            }
            return (mouse_state & MOUSE_HELD_MIDDLE) != 0;
        }
    }
}
