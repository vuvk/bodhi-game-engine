//using SDL;
//using GLFW;

namespace Bodhi {
    public class Input : SubSystem {

        public enum Keycode {
            UNKNOWN    = SDL.Input.Keycode.UNKNOWN,
            RETURN     = SDL.Input.Keycode.RETURN,
            ESCAPE     = SDL.Input.Keycode.ESCAPE,
            BACKSPACE  = SDL.Input.Keycode.BACKSPACE,
            TAB        = SDL.Input.Keycode.TAB,
            SPACE      = SDL.Input.Keycode.SPACE,
            EXCLAIM    = SDL.Input.Keycode.EXCLAIM,
            QUOTEDBL   = SDL.Input.Keycode.QUOTEDBL,
            HASH       = SDL.Input.Keycode.HASH,
            PERCENT    = SDL.Input.Keycode.PERCENT,
            DOLLAR     = SDL.Input.Keycode.DOLLAR,
            AMPERSAND  = SDL.Input.Keycode.AMPERSAND,
            QUOTE      = SDL.Input.Keycode.QUOTE,
            LEFTPAREN  = SDL.Input.Keycode.LEFTPAREN,
            RIGHTPAREN = SDL.Input.Keycode.RIGHTPAREN,
            ASTERISK   = SDL.Input.Keycode.ASTERISK,
            PLUS       = SDL.Input.Keycode.PLUS,
            COMMA      = SDL.Input.Keycode.COMMA,
            MINUS      = SDL.Input.Keycode.MINUS,
            PERIOD     = SDL.Input.Keycode.PERIOD,
            SLASH      = SDL.Input.Keycode.SLASH,
            ZERO       = SDL.Input.Keycode.ZERO,
            ONE        = SDL.Input.Keycode.ONE,
            TWO        = SDL.Input.Keycode.TWO,
            THREE      = SDL.Input.Keycode.THREE,
            FOUR       = SDL.Input.Keycode.FOUR,
            FIVE       = SDL.Input.Keycode.FIVE,
            SIX        = SDL.Input.Keycode.SIX,
            SEVEN      = SDL.Input.Keycode.SEVEN,
            EIGHT      = SDL.Input.Keycode.EIGHT,
            NINE       = SDL.Input.Keycode.NINE,
            COLON      = SDL.Input.Keycode.COLON,
            SEMICOLON  = SDL.Input.Keycode.SEMICOLON,
            LESS       = SDL.Input.Keycode.LESS,
            EQUALS     = SDL.Input.Keycode.EQUALS,
            GREATER    = SDL.Input.Keycode.GREATER,
            QUESTION   = SDL.Input.Keycode.QUESTION,
            AT         = SDL.Input.Keycode.AT,
            LEFTBRACKET = SDL.Input.Keycode.LEFTBRACKET,
            BACKSLASH  = SDL.Input.Keycode.BACKSLASH,
            RIGHTBRACKET = SDL.Input.Keycode.RIGHTBRACKET,
            CARET      = SDL.Input.Keycode.CARET,
            UNDERSCORE = SDL.Input.Keycode.UNDERSCORE,
            BACKQUOTE  = SDL.Input.Keycode.BACKQUOTE,
            A          = SDL.Input.Keycode.a,
            B          = SDL.Input.Keycode.b,
            C          = SDL.Input.Keycode.c,
            D          = SDL.Input.Keycode.d,
            E          = SDL.Input.Keycode.e,
            F          = SDL.Input.Keycode.f,
            G          = SDL.Input.Keycode.g,
            H          = SDL.Input.Keycode.h,
            I          = SDL.Input.Keycode.i,
            J          = SDL.Input.Keycode.j,
            K          = SDL.Input.Keycode.k,
            L          = SDL.Input.Keycode.l,
            M          = SDL.Input.Keycode.m,
            N          = SDL.Input.Keycode.n,
            O          = SDL.Input.Keycode.o,
            P          = SDL.Input.Keycode.p,
            Q          = SDL.Input.Keycode.q,
            R          = SDL.Input.Keycode.r,
            S          = SDL.Input.Keycode.s,
            T          = SDL.Input.Keycode.t,
            U          = SDL.Input.Keycode.u,
            V          = SDL.Input.Keycode.v,
            W          = SDL.Input.Keycode.w,
            X          = SDL.Input.Keycode.x,
            Y          = SDL.Input.Keycode.y,
            Z          = SDL.Input.Keycode.z,
            CAPSLOCK   = SDL.Input.Keycode.CAPSLOCK,
            F1         = SDL.Input.Keycode.F1,
            F2         = SDL.Input.Keycode.F2,
            F3         = SDL.Input.Keycode.F3,
            F4         = SDL.Input.Keycode.F4,
            F5         = SDL.Input.Keycode.F5,
            F6         = SDL.Input.Keycode.F6,
            F7         = SDL.Input.Keycode.F7,
            F8         = SDL.Input.Keycode.F8,
            F9         = SDL.Input.Keycode.F9,
            F10        = SDL.Input.Keycode.F10,
            F11        = SDL.Input.Keycode.F11,
            F12        = SDL.Input.Keycode.F12,
            PRINTSCREEN = SDL.Input.Keycode.PRINTSCREEN,
            SCROLLLOCK = SDL.Input.Keycode.SCROLLLOCK,
            PAUSE      = SDL.Input.Keycode.PAUSE,
            INSERT     = SDL.Input.Keycode.INSERT,
            HOME       = SDL.Input.Keycode.HOME,
            PAGEUP     = SDL.Input.Keycode.PAGEUP,
            DELETE     = SDL.Input.Keycode.DELETE,
            END        = SDL.Input.Keycode.END,
            PAGEDOWN   = SDL.Input.Keycode.PAGEDOWN,
            RIGHT      = SDL.Input.Keycode.RIGHT,
            LEFT       = SDL.Input.Keycode.LEFT,
            DOWN       = SDL.Input.Keycode.DOWN,
            UP         = SDL.Input.Keycode.UP,
            NUMLOCKCLEAR = SDL.Input.Keycode.NUMLOCKCLEAR,
            KP_DIVIDE  = SDL.Input.Keycode.KP_DIVIDE,
            KP_MULTIPLY = SDL.Input.Keycode.KP_MULTIPLY,
            KP_MINUS   = SDL.Input.Keycode.KP_MINUS,
            KP_PLUS    = SDL.Input.Keycode.KP_PLUS,
            KP_ENTER   = SDL.Input.Keycode.KP_ENTER,
            KP_1       = SDL.Input.Keycode.KP_1,
            KP_2       = SDL.Input.Keycode.KP_2,
            KP_3       = SDL.Input.Keycode.KP_3,
            KP_4       = SDL.Input.Keycode.KP_4,
            KP_5       = SDL.Input.Keycode.KP_5,
            KP_6       = SDL.Input.Keycode.KP_6,
            KP_7       = SDL.Input.Keycode.KP_7,
            KP_8       = SDL.Input.Keycode.KP_8,
            KP_9       = SDL.Input.Keycode.KP_9,
            KP_0       = SDL.Input.Keycode.KP_0,
            KP_PERIOD  = SDL.Input.Keycode.KP_PERIOD,
            APPLICATION = SDL.Input.Keycode.APPLICATION,
            POWER      = SDL.Input.Keycode.POWER,
            KP_EQUALS  = SDL.Input.Keycode.KP_EQUALS,
            F13        = SDL.Input.Keycode.F13,
            F14        = SDL.Input.Keycode.F14,
            F15        = SDL.Input.Keycode.F15,
            F16        = SDL.Input.Keycode.F16,
            F17        = SDL.Input.Keycode.F17,
            F18        = SDL.Input.Keycode.F18,
            F19        = SDL.Input.Keycode.F19,
            F20        = SDL.Input.Keycode.F20,
            F21        = SDL.Input.Keycode.F21,
            F22        = SDL.Input.Keycode.F22,
            F23        = SDL.Input.Keycode.F23,
            F24        = SDL.Input.Keycode.F24,
            EXECUTE    = SDL.Input.Keycode.EXECUTE,
            HELP       = SDL.Input.Keycode.HELP,
            MENU       = SDL.Input.Keycode.MENU,
            SELECT     = SDL.Input.Keycode.SELECT,
            STOP       = SDL.Input.Keycode.STOP,
            AGAIN      = SDL.Input.Keycode.AGAIN,
            UNDO       = SDL.Input.Keycode.UNDO,
            CUT        = SDL.Input.Keycode.CUT,
            COPY       = SDL.Input.Keycode.COPY,
            PASTE      = SDL.Input.Keycode.PASTE,
            FIND       = SDL.Input.Keycode.FIND,
            MUTE       = SDL.Input.Keycode.MUTE,
            VOLUMEUP   = SDL.Input.Keycode.VOLUMEUP,
            VOLUMEDOWN = SDL.Input.Keycode.VOLUMEDOWN,
            KP_COMMA   = SDL.Input.Keycode.KP_COMMA,
            KP_EQUALSAS400 = SDL.Input.Keycode.KP_EQUALSAS400,
            ALTERASE   = SDL.Input.Keycode.ALTERASE,
            SYSREQ     = SDL.Input.Keycode.SYSREQ,
            CANCEL     = SDL.Input.Keycode.CANCEL,
            CLEAR      = SDL.Input.Keycode.CLEAR,
            PRIOR      = SDL.Input.Keycode.PRIOR,
            RETURN2    = SDL.Input.Keycode.RETURN2,
            SEPARATOR  = SDL.Input.Keycode.SEPARATOR,
            OUT        = SDL.Input.Keycode.OUT,
            OPER       = SDL.Input.Keycode.OPER,
            CLEARAGAIN = SDL.Input.Keycode.CLEARAGAIN,
            CRSEL      = SDL.Input.Keycode.CRSEL,
            EXSEL      = SDL.Input.Keycode.EXSEL,
            KP_00      = SDL.Input.Keycode.KP_00,
            KP_000     = SDL.Input.Keycode.KP_000,
            THOUSANDSSEPARATOR = SDL.Input.Keycode.THOUSANDSSEPARATOR,
            DECIMALSEPARATOR = SDL.Input.Keycode.DECIMALSEPARATOR,
            CURRENCYUNIT = SDL.Input.Keycode.CURRENCYUNIT,
            CURRENCYSUBUNIT = SDL.Input.Keycode.CURRENCYSUBUNIT,
            KP_LEFTPAREN = SDL.Input.Keycode.KP_LEFTPAREN,
            KP_RIGHTPAREN = SDL.Input.Keycode.KP_RIGHTPAREN,
            KP_LEFTBRACE = SDL.Input.Keycode.KP_LEFTBRACE,
            KP_RIGHTBRACE = SDL.Input.Keycode.KP_RIGHTBRACE,
            KP_TAB     = SDL.Input.Keycode.KP_TAB,
            KP_BACKSPACE = SDL.Input.Keycode.KP_BACKSPACE,
            KP_A       = SDL.Input.Keycode.KP_A,
            KP_B       = SDL.Input.Keycode.KP_B,
            KP_C       = SDL.Input.Keycode.KP_C,
            KP_D       = SDL.Input.Keycode.KP_D,
            KP_E       = SDL.Input.Keycode.KP_E,
            KP_F       = SDL.Input.Keycode.KP_F,
            KP_XOR     = SDL.Input.Keycode.KP_XOR,
            KP_POWER   = SDL.Input.Keycode.KP_POWER,
            KP_PERCENT = SDL.Input.Keycode.KP_PERCENT,
            KP_LESS    = SDL.Input.Keycode.KP_LESS,
            KP_GREATER = SDL.Input.Keycode.KP_GREATER,
            KP_AMPERSAND = SDL.Input.Keycode.KP_AMPERSAND,
            KP_DBLAMPERSAND = SDL.Input.Keycode.KP_DBLAMPERSAND,
            KP_VERTICALBAR = SDL.Input.Keycode.KP_VERTICALBAR,
            KP_DBLVERTICALBAR = SDL.Input.Keycode.KP_DBLVERTICALBAR,
            KP_COLON   = SDL.Input.Keycode.KP_COLON,
            KP_HASH    = SDL.Input.Keycode.KP_HASH,
            KP_SPACE   = SDL.Input.Keycode.KP_SPACE,
            KP_AT      = SDL.Input.Keycode.KP_AT,
            KP_EXCLAM  = SDL.Input.Keycode.KP_EXCLAM,
            KP_MEMSTORE = SDL.Input.Keycode.KP_MEMSTORE,
            KP_MEMRECALL = SDL.Input.Keycode.KP_MEMRECALL,
            KP_MEMCLEAR = SDL.Input.Keycode.KP_MEMCLEAR,
            KP_MEMADD  = SDL.Input.Keycode.KP_MEMADD,
            KP_MEMSUBTRACT = SDL.Input.Keycode.KP_MEMSUBTRACT,
            KP_MEMMULTIPLY = SDL.Input.Keycode.KP_MEMMULTIPLY,
            KP_MEMDIVIDE = SDL.Input.Keycode.KP_MEMDIVIDE,
            KP_PLUSMINUS = SDL.Input.Keycode.KP_PLUSMINUS,
            KP_CLEAR   = SDL.Input.Keycode.KP_CLEAR,
            KP_CLEARENTRY = SDL.Input.Keycode.KP_CLEARENTRY,
            KP_BINARY  = SDL.Input.Keycode.KP_BINARY,
            KP_OCTAL   = SDL.Input.Keycode.KP_OCTAL,
            KP_DECIMAL = SDL.Input.Keycode.KP_DECIMAL,
            KP_HEXADECIMAL = SDL.Input.Keycode.KP_HEXADECIMAL,
            LCTRL      = SDL.Input.Keycode.LCTRL,
            LSHIFT     = SDL.Input.Keycode.LSHIFT,
            LALT       = SDL.Input.Keycode.LALT,
            LGUI       = SDL.Input.Keycode.LGUI,
            RCTRL      = SDL.Input.Keycode.RCTRL,
            RSHIFT     = SDL.Input.Keycode.RSHIFT,
            RALT       = SDL.Input.Keycode.RALT,
            RGUI       = SDL.Input.Keycode.RGUI,
            MODE       = SDL.Input.Keycode.MODE,
            AUDIONEXT  = SDL.Input.Keycode.AUDIONEXT,
            AUDIOPREV  = SDL.Input.Keycode.AUDIOPREV,
            AUDIOSTOP  = SDL.Input.Keycode.AUDIOSTOP,
            AUDIOPLAY  = SDL.Input.Keycode.AUDIOPLAY,
            AUDIOMUTE  = SDL.Input.Keycode.AUDIOMUTE,
            MEDIASELECT = SDL.Input.Keycode.MEDIASELECT,
            WWW        = SDL.Input.Keycode.WWW,
            MAIL       = SDL.Input.Keycode.MAIL,
            CALCULATOR = SDL.Input.Keycode.CALCULATOR,
            COMPUTER   = SDL.Input.Keycode.COMPUTER,
            AC_SEARCH  = SDL.Input.Keycode.AC_SEARCH,
            AC_HOME    = SDL.Input.Keycode.AC_HOME,
            AC_BACK    = SDL.Input.Keycode.AC_BACK,
            AC_FORWARD = SDL.Input.Keycode.AC_FORWARD,
            AC_STOP    = SDL.Input.Keycode.AC_STOP,
            AC_REFRESH = SDL.Input.Keycode.AC_REFRESH,
            AC_BOOKMARKS = SDL.Input.Keycode.AC_BOOKMARKS,
            BRIGHTNESSDOWN = SDL.Input.Keycode.BRIGHTNESSDOWN,
            BRIGHTNESSUP = SDL.Input.Keycode.BRIGHTNESSUP,
            DISPLAYSWITCH = SDL.Input.Keycode.DISPLAYSWITCH,
            KBDILLUMTOGGLE = SDL.Input.Keycode.KBDILLUMTOGGLE,
            KBDILLUMDOWN = SDL.Input.Keycode.KBDILLUMDOWN,
            KBDILLUMUP = SDL.Input.Keycode.KBDILLUMUP,
            EJECT      = SDL.Input.Keycode.EJECT,
            SLEEP      = SDL.Input.Keycode.SLEEP
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
            return key_pressed[SDL.Input.Scancode.from_keycode((SDL.Input.Keycode)keycode)];
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
