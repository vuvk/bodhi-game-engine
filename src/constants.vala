
namespace Bodhi {
    /** ERROR CODES */
    public enum Errors {
        NO_ERROR               = 0,
        ENGINE_NOT_CREATED     = 1,
        ENGINE_NOT_STARTED     = 2,
        WINDOW_NOT_CREATED     = 3,
        RENDERER_NOT_CREATED   = 4,
        SCENE_NOT_CREATED      = 5,
        INPUT_NOT_CREATED      = 6
    }

    /** maximums */
    public const int MAX_NAME_LENGTH   = 64;
    public const int MAX_PATH_LENGTH   = 256;
    public const int MAX_STRING_LENGTH = 1024;
}