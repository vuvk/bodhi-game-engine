namespace Bodhi {

    /** vector with 2 integer components */
    public struct Vector2i {
        public static Vector2i ZERO() { return {0, 0}; }
        public static Vector2i ONE()  { return {1, 1}; }

        public int x {get; set;}
        public int y {get; set;}

        public Vector2i(int x, int y) {
            set_xy(x, y);
        }

        public Vector2i.from_v2i(Vector2i other) {
            this(other.x, other.y);
        }

        public void set_xy(int x, int y) {
            this.x = x;
            this.y = y;
        }

        public string to_string() {
            return @"x=$x;\ty=$y";
        }
    }

    /** vector with 2 floats components */
    public struct Vector2f {
        public static Vector2f ZERO() { return {0, 0}; }
        public static Vector2f ONE()  { return {1, 1}; }

        public float x {get; set;}
        public float y {get; set;}

        public Vector2f(float x, float y) {
            set_xy(x, y);
        }

        public Vector2f.from_v2f(Vector2f other) {
            this(other.x, other.y);
        }

        public Vector2f.from_array(float[] components) {
            this(components[0], components[1]);
        }

        public void set_xy(float x, float y) {
            this.x = x;
            this.y = y;
        }

        public Vector2f add(Vector2f other) {
            return { x + other.x, y + other.y };
        }

        public Vector2f sub(Vector2f other) {
            return { x - other.x, y - other.y };
        }

        public Vector2f mul(float value) {
            return { x * value, y * value };
        }

        public Vector2f div(float value) {
            if (value != 0.0f) {
                value = 1.0f / value;
                return { x * value, y * value };
            } else {
                return ZERO();
            }
        }

        public Vector2f neg() {
            return { -x, -y };
        }

        public float dot(Vector2f other) {
            return x * other.x + y * other.y;
        }

        public Vector2f normalize() {
            return div(length());
        }

        public float length() {
            return Math.sqrtf(x*x + y*y);
        }

        public float distance(Vector2f other) {
            return (this.sub(other)).length();
        }

        public float[] to_array() {
            return new float[]{x, y};
        }

        public string to_string() {
            return @"x=$x;\ty=$y";
        }
    }
}
