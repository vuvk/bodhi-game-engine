/* glut.vapi
 *
 * Copyright (C) 2008  José David Abad
 * Copyright (C) 2008  Matias De la Puente
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 *  José David Abad <granveoduendes@gmail.com>
 *  Matias De la Puente <mfpuente.ar@gmail.com>
 */

using GLES2;

[CCode (lower_case_cprefix ="", cheader_filename="GL/freeglut.h")]
namespace GLUT
{
    /* ***********************************************************************************
     * FILE: freeglut_std.h
     */

    /*
    * GLUT API macro definitions -- the special key codes:
    */
    public const GLenum GLUT_KEY_F1;
    public const GLenum GLUT_KEY_F2;
    public const GLenum GLUT_KEY_F3;
    public const GLenum GLUT_KEY_F4;
    public const GLenum GLUT_KEY_F5;
    public const GLenum GLUT_KEY_F6;
    public const GLenum GLUT_KEY_F7;
    public const GLenum GLUT_KEY_F8;
    public const GLenum GLUT_KEY_F9;
    public const GLenum GLUT_KEY_F10;
    public const GLenum GLUT_KEY_F11;
    public const GLenum GLUT_KEY_F12;
    public const GLenum GLUT_KEY_LEFT;
    public const GLenum GLUT_KEY_UP;
    public const GLenum GLUT_KEY_RIGHT;
    public const GLenum GLUT_KEY_DOWN;
    public const GLenum GLUT_KEY_PAGE_UP;
    public const GLenum GLUT_KEY_PAGE_DOWN;
    public const GLenum GLUT_KEY_HOME;
    public const GLenum GLUT_KEY_END;
    public const GLenum GLUT_KEY_INSERT;


    /*
     * GLUT API macro definitions -- mouse state definitions
     */
    public const GLenum GLUT_LEFT_BUTTON;
    public const GLenum GLUT_MIDDLE_BUTTON;
    public const GLenum GLUT_RIGHT_BUTTON;
    public const GLenum GLUT_DOWN;
    public const GLenum GLUT_UP;
    public const GLenum GLUT_LEFT;
    public const GLenum GLUT_ENTERED;

    /*
     * GLUT API macro definitions -- the display mode definitions
     */
    public const GLenum GLUT_RGB;
    public const GLenum GLUT_RGBA;
    public const GLenum GLUT_INDEX;
    public const GLenum GLUT_SINGLE;
    public const GLenum GLUT_DOUBLE;
    public const GLenum GLUT_ACCUM;
    public const GLenum GLUT_ALPHA;
    public const GLenum GLUT_DEPTH;
    public const GLenum GLUT_STENCIL;
    public const GLenum GLUT_MULTISAMPLE;
    public const GLenum GLUT_STEREO;
    public const GLenum GLUT_LUMINANCE;

    /*
     * GLUT API macro definitions -- windows and menu related definitions
     */
    public const GLenum GLUT_MENU_NOT_IN_USE;
    public const GLenum GLUT_MENU_IN_USE;
    public const GLenum GLUT_NOT_VISIBLE;
    public const GLenum GLUT_VISIBLE;
    public const GLenum GLUT_HIDDEN;
    public const GLenum GLUT_FULLY_RETAINED;
    public const GLenum GLUT_PARTIALLY_RETAINED;
    public const GLenum GLUT_FULLY_COVERED;

    /*
     * GLUT API macro definitions -- fonts definitions
     *
     * Steve Baker suggested to make it binary compatible with GLUT:
    */
    public const GLvoid GLUT_STROKE_ROMAN;
    public const GLvoid GLUT_STROKE_MONO_ROMAN;
    public const GLvoid GLUT_BITMAP_9_BY_15;
    public const GLvoid GLUT_BITMAP_8_BY_13;
    public const GLvoid GLUT_BITMAP_TIMES_ROMAN_10;
    public const GLvoid GLUT_BITMAP_TIMES_ROMAN_24;
    public const GLvoid GLUT_BITMAP_HELVETICA_10;
    public const GLvoid GLUT_BITMAP_HELVETICA_12;
    public const GLvoid GLUT_BITMAP_HELVETICA_18;

    /*
     * GLUT API macro definitions -- the glutGet parameters
     */
    public const GLenum GLUT_WINDOW_X;
    public const GLenum GLUT_WINDOW_Y;
    public const GLenum GLUT_WINDOW_WIDTH;
    public const GLenum GLUT_WINDOW_HEIGHT;
    public const GLenum GLUT_WINDOW_BUFFER_SIZE;
    public const GLenum GLUT_WINDOW_STENCIL_SIZE;
    public const GLenum GLUT_WINDOW_DEPTH_SIZE;
    public const GLenum GLUT_WINDOW_RED_SIZE;
    public const GLenum GLUT_WINDOW_GREEN_SIZE;
    public const GLenum GLUT_WINDOW_BLUE_SIZE;
    public const GLenum GLUT_WINDOW_ALPHA_SIZE;
    public const GLenum GLUT_WINDOW_ACCUM_RED_SIZE;
    public const GLenum GLUT_WINDOW_ACCUM_GREEN_SIZE;
    public const GLenum GLUT_WINDOW_ACCUM_BLUE_SIZE;
    public const GLenum GLUT_WINDOW_ACCUM_ALPHA_SIZE;
    public const GLenum GLUT_WINDOW_DOUBLEBUFFER;
    public const GLenum GLUT_WINDOW_RGBA;
    public const GLenum GLUT_WINDOW_PARENT;
    public const GLenum GLUT_WINDOW_NUM_CHILDREN;
    public const GLenum GLUT_WINDOW_COLORMAP_SIZE;
    public const GLenum GLUT_WINDOW_NUM_SAMPLES;
    public const GLenum GLUT_WINDOW_STEREO;
    public const GLenum GLUT_WINDOW_CURSOR;

    public const GLenum GLUT_SCREEN_WIDTH;
    public const GLenum GLUT_SCREEN_HEIGHT;
    public const GLenum GLUT_SCREEN_WIDTH_MM;
    public const GLenum GLUT_SCREEN_HEIGHT_MM;
    public const GLenum GLUT_MENU_NUM_ITEMS;
    public const GLenum GLUT_DISPLAY_MODE_POSSIBLE;
    public const GLenum GLUT_INIT_WINDOW_X;
    public const GLenum GLUT_INIT_WINDOW_Y;
    public const GLenum GLUT_INIT_WINDOW_WIDTH;
    public const GLenum GLUT_INIT_WINDOW_HEIGHT;
    public const GLenum GLUT_INIT_DISPLAY_MODE;
    public const GLenum GLUT_ELAPSED_TIME;
    public const GLenum GLUT_WINDOW_FORMAT_ID;
    public const GLenum GLUT_INIT_STATE;

    /*
     * GLUT API macro definitions -- the glutDeviceGet parameters
     */
    public const GLenum GLUT_HAS_KEYBOARD;
    public const GLenum GLUT_HAS_MOUSE;
    public const GLenum GLUT_HAS_SPACEBALL;
    public const GLenum GLUT_HAS_DIAL_AND_BUTTON_BOX;
    public const GLenum GLUT_HAS_TABLET;
    public const GLenum GLUT_NUM_MOUSE_BUTTONS;
    public const GLenum GLUT_NUM_SPACEBALL_BUTTONS;
    public const GLenum GLUT_NUM_BUTTON_BOX_BUTTONS;
    public const GLenum GLUT_NUM_DIALS;
    public const GLenum GLUT_NUM_TABLET_BUTTONS;
    public const GLenum GLUT_DEVICE_IGNORE_KEY_REPEAT;
    public const GLenum GLUT_DEVICE_KEY_REPEAT;
    public const GLenum GLUT_HAS_JOYSTICK;
    public const GLenum GLUT_OWNS_JOYSTICK;
    public const GLenum GLUT_JOYSTICK_BUTTONS;
    public const GLenum GLUT_JOYSTICK_AXES;
    public const GLenum GLUT_JOYSTICK_POLL_RATE;

    /*
     * GLUT API macro definitions -- the glutLayerGet parameters
     */
    public const GLenum GLUT_OVERLAY_POSSIBLE;
    public const GLenum GLUT_LAYER_IN_USE;
    public const GLenum GLUT_HAS_OVERLAY;
    public const GLenum GLUT_TRANSPARENT_INDEX;
    public const GLenum GLUT_NORMAL_DAMAGED;
    public const GLenum GLUT_OVERLAY_DAMAGED;

    /*
     * GLUT API macro definitions -- the glutVideoResizeGet parameters
     */
    public const GLenum GLUT_VIDEO_RESIZE_POSSIBLE;
    public const GLenum GLUT_VIDEO_RESIZE_IN_USE;
    public const GLenum GLUT_VIDEO_RESIZE_X_DELTA;
    public const GLenum GLUT_VIDEO_RESIZE_Y_DELTA;
    public const GLenum GLUT_VIDEO_RESIZE_WIDTH_DELTA;
    public const GLenum GLUT_VIDEO_RESIZE_HEIGHT_DELTA;
    public const GLenum GLUT_VIDEO_RESIZE_X;
    public const GLenum GLUT_VIDEO_RESIZE_Y;
    public const GLenum GLUT_VIDEO_RESIZE_WIDTH;
    public const GLenum GLUT_VIDEO_RESIZE_HEIGHT;

    /*
     * GLUT API macro definitions -- the glutUseLayer parameters
     */
    public const GLenum GLUT_NORMAL;
    public const GLenum GLUT_OVERLAY;

    /*
     * GLUT API macro definitions -- the glutGetModifiers parameters
     */
    public const GLenum GLUT_ACTIVE_SHIFT;
    public const GLenum GLUT_ACTIVE_CTRL;
    public const GLenum GLUT_ACTIVE_ALT;

    /*
     * GLUT API macro definitions -- the glutSetCursor parameters
     */
    public const GLenum GLUT_CURSOR_RIGHT_ARROW;
    public const GLenum GLUT_CURSOR_LEFT_ARROW;
    public const GLenum GLUT_CURSOR_INFO;
    public const GLenum GLUT_CURSOR_DESTROY;
    public const GLenum GLUT_CURSOR_HELP;
    public const GLenum GLUT_CURSOR_CYCLE;
    public const GLenum GLUT_CURSOR_SPRAY;
    public const GLenum GLUT_CURSOR_WAIT;
    public const GLenum GLUT_CURSOR_TEXT;
    public const GLenum GLUT_CURSOR_CROSSHAIR;
    public const GLenum GLUT_CURSOR_UP_DOWN;
    public const GLenum GLUT_CURSOR_LEFT_RIGHT;
    public const GLenum GLUT_CURSOR_TOP_SIDE;
    public const GLenum GLUT_CURSOR_BOTTOM_SIDE;
    public const GLenum GLUT_CURSOR_LEFT_SIDE;
    public const GLenum GLUT_CURSOR_RIGHT_SIDE;
    public const GLenum GLUT_CURSOR_TOP_LEFT_CORNER;
    public const GLenum GLUT_CURSOR_TOP_RIGHT_CORNER;
    public const GLenum GLUT_CURSOR_BOTTOM_RIGHT_CORNER;
    public const GLenum GLUT_CURSOR_BOTTOM_LEFT_CORNER;
    public const GLenum GLUT_CURSOR_INHERIT;
    public const GLenum GLUT_CURSOR_NONE;
    public const GLenum GLUT_CURSOR_FULL_CROSSHAIR;

    /*
     * GLUT API macro definitions -- RGB color component specification definitions
     */
    public const GLenum GLUT_RED;
    public const GLenum GLUT_GREEN;
    public const GLenum GLUT_BLUE;

    /*
     * GLUT API macro definitions -- additional keyboard and joystick definitions
     */
    public const GLenum GLUT_KEY_REPEAT_OFF;
    public const GLenum GLUT_KEY_REPEAT_ON;
    public const GLenum GLUT_KEY_REPEAT_DEFAULT;

    public const GLenum GLUT_JOYSTICK_BUTTON_A;
    public const GLenum GLUT_JOYSTICK_BUTTON_B;
    public const GLenum GLUT_JOYSTICK_BUTTON_C;
    public const GLenum GLUT_JOYSTICK_BUTTON_D;

    /*
     * GLUT API macro definitions -- game mode definitions
     */
    public const GLenum GLUT_GAME_MODE_ACTIVE;
    public const GLenum GLUT_GAME_MODE_POSSIBLE;
    public const GLenum GLUT_GAME_MODE_WIDTH;
    public const GLenum GLUT_GAME_MODE_HEIGHT;
    public const GLenum GLUT_GAME_MODE_PIXEL_DEPTH;
    public const GLenum GLUT_GAME_MODE_REFRESH_RATE;
    public const GLenum GLUT_GAME_MODE_DISPLAY_CHANGED;

    /*
     * Initialization functions, see fglut_init.c
     */
//  public static void glutInit (int* argcp, string[] argv);
//  public static void glutInit (ref int argcp, unowned string[] argv);
    public static void glutInit (ref int argcp, [CCode (array_length = false)] string[] argv);
    public static void glutInitWindowPosition (int x, int y);
    public static void glutInitWindowSize (int width, int height);
    public static void glutInitDisplayMode (uint displayMode);
    public static void glutInitDisplayString (string displayMode);

    /*
     * Process loop function, see freeglut_main.c
     */
    public static void glutMainLoop ();

    /*
     * Window management functions, see freeglut_window.c
     */
    public static int  glutCreateWindow (string title);
    public static int  glutCreateSubWindow (int window, int x, int y, int width, int height);
    public static void glutDestroyWindow (int window);
    public static void glutSetWindow (int window);
    public static int  glutGetWindow ();
    public static void glutSetWindowTitle (string title);
    public static void glutSetIconTitle (string title);
    public static void glutReshapeWindow (int width, int height);
    public static void glutPositionWindow (int x, int y);
    public static void glutShowWindow ();
    public static void glutHideWindow ();
    public static void glutIconifyWindow ();
    public static void glutPushWindow ();
    public static void glutPopWindow ();
    public static void glutFullScreen();

    /*
     * Display-connected functions, see freeglut_display.c
     */
    public static void glutPostWindowRedisplay (int window);
    public static void glutPostRedisplay ();
    public static void glutSwapBuffers ();

    /*
     * Mouse cursor functions, see freeglut_cursor.c
     */
    public static void glutWarpPointer (int x, int y);
    public static void glutSetCursor (int cursor);

    /*
     * Overlay stuff, see freeglut_overlay.c
     */
    public static void glutEstablishOverlay ();
    public static void glutRemoveOverlay ();
    public static void glutUseLayer (GLenum layer);
    public static void glutPostOverlayRedisplay ();
    public static void glutPostWindowOverlayRedisplay (int window);
    public static void glutShowOverlay ();
    public static void glutHideOverlay ();

    /*
     * Menu stuff, see freeglut_menu.c
     */
    [CCode (has_target = false)]
    public delegate void on_glutCreateMenu (int menu);
    public static int glutCreateMenu (on_glutCreateMenu menu);
    public static void glutDestroyMenu (int menu);
    public static int  glutGetMenu ();
    public static void glutSetMenu (int menu);
    public static void glutAddMenuEntry (string label, int value);
    public static void glutAddSubMenu (string label, int subMenu);
    public static void glutChangeToMenuEntry (int item, string label, int value);
    public static void glutChangeToSubMenu( int item, string label, int value);
    public static void glutRemoveMenuItem (int item);
    public static void glutAttachMenu (int button);
    public static void glutDetachMenu (int button);

    /*
     * Global callback functions, see freeglut_callbacks.c
     */
    [CCode (has_target = false)]
    public delegate void on_glutTimerFunc (int _val1);
    public static void glutTimerFunc (uint time, on_glutTimerFunc func, int value);
    [CCode (has_target = false)]
    public delegate void on_glutIdleFunc ();
    public static void glutIdleFunc (on_glutIdleFunc? func);

    /*
     * Window-specific callback functions, see freeglut_callbacks.c
     */
    [CCode (has_target = false)]
    public delegate void on_glutKeyboardFunc (uchar _val1, int _val2, int _val3);
    public static void glutKeyboardFunc (on_glutKeyboardFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutSpecialFunc (int _val1, int _val2, int _val3);
    public static void glutSpecialFunc (on_glutSpecialFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutReshapeFunc (int _val1, int _val2);
    public static void glutReshapeFunc (on_glutReshapeFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutVisibilityFunc (int _val1);
    public static void glutVisibilityFunc (on_glutVisibilityFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutDisplayFunc ();
    public static void glutDisplayFunc (on_glutDisplayFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutMouseFunc (int _val1, int _val2, int _val3, int _val4);
    public static void glutMouseFunc (on_glutMouseFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutMotionFunc (int _val1, int _val2);
    public static void glutMotionFunc (on_glutMotionFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutPassiveMotionFunc (int _val1, int _val2);
    public static void glutPassiveMotionFunc (on_glutPassiveMotionFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutEntryFunc (int _val1);
    public static void glutEntryFunc (on_glutEntryFunc func);

    [CCode (has_target = false)]
    public delegate void on_glutKeyboardUpFunc (uchar _val1, int _val2, int _val3);
    public static void glutKeyboardUpFunc (on_glutKeyboardUpFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutSpecialUpFunc (int _val1, int _val2, int _val3);
    public static void glutSpecialUpFunc (on_glutSpecialUpFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutJoystickFunc (uint _val1, int _val2, int _val3, int _val4);
    public static void glutJoystickFunc (on_glutJoystickFunc func, int pollInterval);
    [CCode (has_target = false)]
    public delegate void on_glutMenuStateFunc (int _val1);
    public static void glutMenuStateFunc (on_glutMenuStateFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutMenuStatusFunc (int _val1, int _val2, int _val3);
    public static void glutMenuStatusFunc (on_glutMenuStatusFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutOverlayDisplayFunc ();
    public static void glutOverlayDisplayFunc (on_glutOverlayDisplayFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutWindowStatusFunc (int _val1);
    public static void glutWindowStatusFunc (on_glutWindowStatusFunc func);

    [CCode (has_target = false)]
    public delegate void on_glutSpaceballMotionFunc (int _val1, int _val2, int _val3);
    public static void glutSpaceballMotionFunc (on_glutSpaceballMotionFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutSpaceballRotateFunc (int _val1, int _val2, int _val3);
    public static void glutSpaceballRotateFunc (on_glutSpaceballRotateFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutSpaceballButtonFunc (int _val1, int _val2);
    public static void glutSpaceballButtonFunc (on_glutSpaceballButtonFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutButtonBoxFunc (int _val1, int _val2);
    public static void glutButtonBoxFunc (on_glutButtonBoxFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutDialsFunc (int _val1, int _val2);
    public static void glutDialsFunc (on_glutDialsFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutTabletMotionFunc (int _val1, int _val2);
    public static void glutTabletMotionFunc (on_glutTabletMotionFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutTabletButtonFunc (int _val1, int _val2, int _val3, int _val4);
    public static void glutTabletButtonFunc (on_glutTabletButtonFunc func);

    /*
     * State setting and retrieval functions, see freeglut_state.c
     */
    public static int glutGet (GLenum query);
    public static int glutDeviceGet (GLenum query);
    public static int glutGetModifiers ();
    public static int glutLayerGet (GLenum query);

    /*
     * Font stuff, see freeglut_font.c
     */
    public static void glutBitmapCharacter (void* font, int character);
    public static int  glutBitmapWidth (void* font, int character);
    public static void glutStrokeCharacter (void* font, int character);
    public static int  glutStrokeWidth (void* font, int character);
//public static int  glutBitmapLength (void* font, const unsigned char* string);
    public static int  glutBitmapLength (void* font, string _string);
//public static int  glutStrokeLength (void* font, const unsigned char* string);
    public static int  glutStrokeLength (void* font, string _string);

    /*
     * Geometry functions, see freeglut_geometry.c
     */
    public static void glutWireCube (GLdouble size);
    public static void glutSolidCube (GLdouble size);
    public static void glutWireSphere (GLdouble radius, GLint slices, GLint stacks);
    public static void glutSolidSphere (GLdouble radius, GLint slices, GLint stacks);
    public static void glutWireCone (GLdouble base, GLdouble height, GLint slices, GLint stacks);
    public static void glutSolidCone (GLdouble base, GLdouble height, GLint slices, GLint stacks);

    public static void glutWireTorus (GLdouble innerRadius, GLdouble outerRadius, GLint sides, GLint rings);
    public static void glutSolidTorus (GLdouble innerRadius, GLdouble outerRadius, GLint sides, GLint rings);
    public static void glutWireDodecahedron ();
    public static void glutSolidDodecahedron ();
    public static void glutWireOctahedron ();
    public static void glutSolidOctahedron ();
    public static void glutWireTetrahedron ();
    public static void glutSolidTetrahedron ();
    public static void glutWireIcosahedron ();
    public static void glutSolidIcosahedron ();

    /*
     * Teapot rendering functions, found in freeglut_teapot.c
     */
    public static void glutWireTeapot (GLdouble size);
    public static void glutSolidTeapot (GLdouble size);

    /*
     * Game mode functions, see freeglut_gamemode.c
     */
    public static void glutGameModeString (string _string);
    public static int  glutEnterGameMode ();
    public static void glutLeaveGameMode ();
    public static int  glutGameModeGet (GLenum query);

    /*
     * Video resize functions, see freeglut_videoresize.c
     */
    public static int  glutVideoResizeGet (GLenum query);
    public static void glutSetupVideoResizing ();
    public static void glutStopVideoResizing ();
    public static void glutVideoResize (int x, int y, int width, int height);
    public static void glutVideoPan (int x, int y, int width, int height);

    /*
     * Colormap functions, see freeglut_misc.c
     */
    public static void    glutSetColor (int color, GLfloat red, GLfloat green, GLfloat blue);
    public static GLfloat glutGetColor (int color, int component);
    public static void    glutCopyColormap (int window);

    /*
    * Misc keyboard and joystick functions, see freeglut_misc.c
     */
    public static void glutIgnoreKeyRepeat (int ignore);
    public static void glutSetKeyRepeat (int repeatMode);
    public static void glutForceJoystickFunc ();

    /*
    * Misc functions, see freeglut_misc.c
    */
    public static int  glutExtensionSupported (string extension);
    public static void glutReportErrors ();

    /* ***********************************************************************************
     * FILE: freeglut_ext.h
     */

    /*
     * GLUT API Extension macro definitions -- behaviour when the user clicks on an "x" to close a window
     */
    public const GLenum GLUT_ACTION_EXIT;
    public const GLenum GLUT_ACTION_GLUTMAINLOOP_RETURNS;
    public const GLenum GLUT_ACTION_CONTINUE_EXECUTION;

    /*
     * Create a new rendering context when the user opens a new window?
     */
    public const GLenum GLUT_CREATE_NEW_CONTEXT;
    public const GLenum GLUT_USE_CURRENT_CONTEXT;

    /*
     * Direct/Indirect rendering context options (has meaning only in Unix/X11)
     */
    public const GLenum GLUT_FORCE_INDIRECT_CONTEXT;
    public const GLenum GLUT_ALLOW_DIRECT_CONTEXT;
    public const GLenum GLUT_TRY_DIRECT_CONTEXT;
    public const GLenum GLUT_FORCE_DIRECT_CONTEXT;

    /*
     * GLUT API Extension macro definitions -- the glutGet parameters
     */
    public const GLenum GLUT_ACTION_ON_WINDOW_CLOSE;

    public const GLenum GLUT_WINDOW_BORDER_WIDTH;
    public const GLenum GLUT_WINDOW_HEADER_HEIGHT;

    public const GLenum GLUT_VERSION;

    public const GLenum GLUT_RENDERING_CONTEXT;
    public const GLenum GLUT_DIRECT_RENDERING;

    /*
     * New tokens for glutInitDisplayMode.
     * Only one GLUT_AUXn bit may be used at a time.
     * Value 0x0400 is defined in OpenGLUT.
     */
    public const GLenum GLUT_AUX1;
    public const GLenum GLUT_AUX2;
    public const GLenum GLUT_AUX3;
    public const GLenum GLUT_AUX4;

    /*
     * Process loop function, see freeglut_main.c
     */
    public static void glutMainLoopEvent ();
    public static void glutLeaveMainLoop ();

    /*
     * Window-specific callback functions, see freeglut_callbacks.c
     */
    [CCode (has_target = false)]
    public delegate void on_glutMouseWheelFunc (int _val1, int _val2, int _val3, int _val4);
    public static void glutMouseWheelFunc (on_glutMouseWheelFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutCloseFunc ();
    public static void glutCloseFunc (on_glutCloseFunc func);
    [CCode (has_target = false)]
    public delegate void on_glutWMCloseFunc ();
    public static void glutWMCloseFunc (on_glutWMCloseFunc func);
    /* A. Donev: Also a destruction callback for menus */
    [CCode (has_target = false)]
    public delegate void on_glutMenuDestroyFunc ();
    public static void glutMenuDestroyFunc (on_glutMenuDestroyFunc func);

    /*
     * State setting and retrieval functions, see freeglut_state.c
     */

    public static void glutSetOption (GLenum option_flag, int value);
    /* A.Donev: User-data manipulation */
    public static void* glutGetWindowData ();
    public static void glutSetWindowData (void* data);
    public static void* glutGetMenuData ();
    public static void glutSetMenuData (void* data);

    /*
     * Font stuff, see freeglut_font.c
     */
    public static int glutBitmapHeight (void* font);
    public static GLfloat glutStrokeHeight (void* font);
// public static void glutBitmapString (void* font, const unsigned char *string);
// public static void glutStrokeString (void* font, const unsigned char *string);

    /*
     * Geometry functions, see freeglut_geometry.c
     */
    public static void glutWireRhombicDodecahedron ();
    public static void glutSolidRhombicDodecahedron ();
// public static void glutWireSierpinskiSponge (int num_levels, GLdouble offset[3], GLdouble scale);
// public static void glutSolidSierpinskiSponge (int num_levels, GLdouble offset[3], GLdouble scale);
    public static void glutWireCylinder (GLdouble radius, GLdouble height, GLint slices, GLint stacks);
    public static void glutSolidCylinder (GLdouble radius, GLdouble height, GLint slices, GLint stacks);

    /*
     * Extension functions, see freeglut_ext.c
     */
//typedef void (*GLUTproc)();
// public static GLUTproc glutGetProcAddress (const char *procName);
}
