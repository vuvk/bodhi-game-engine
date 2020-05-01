namespace Bodhi {

    public struct Vector4f {
        public float x {get; set;}
        public float y {get; set;}
        public float z {get; set;}
        public float w {get; set;}

        public static Vector4f ZERO() { return { 0, 0, 0, 0 }; }

        public Vector4f(float x, float y, float z, float w) {
            set_xyzw(x, y, z, w);
        }

        public Vector4f.from_v2f(Vector2f other) {
            this(other.x, other.y, 0.0f, 1.0f);
        }

        public Vector4f.from_v3f(Vector3f other) {
            this(other.x, other.y, other.z, 1.0f);
        }

        public Vector4f.from_v4f(Vector4f other) {
            this(other.x, other.y, other.z, other.w);
        }

        public Vector4f.from_array(float[] components) {
            this(components[0], components[1], components[2], components[3]);
        }

        public void set_xyzw(float x, float y, float z, float w) {
            this.x = x;
            this.y = y;
            this.z = z;
            this.w = w;
        }

        public Vector4f add_v2f(Vector2f other) {
            return { x + other.x, y + other.y, z, w };
        }

        public Vector4f add_v3f(Vector3f other) {
            return { x + other.x, y + other.y, z + other.z, w };
        }

        public Vector4f add(Vector4f other) {
            return { x + other.x, y + other.y, z + other.z, w + other.w };
        }

        public Vector4f sub_v2f(Vector2f other) {
            return { x - other.x, y - other.y, z, w };
        }

        public Vector4f sub_v3f(Vector3f other) {
            return { x - other.x, y - other.y, z - other.z, w };
        }

        public Vector4f sub(Vector4f other) {
            return { x - other.x, y - other.y, z - other.z, w - other.w };
        }

        public Vector4f mul(float value) {
            return { x * value, y * value, z * value, w * value };
        }

        public Vector4f div(float value) {
            if (value != 0.0f) {
                value = 1.0f / value;
                return { x * value, y * value, z * value, w * value };
            } else {
                return ZERO();
            }
        }

        public Vector4f neg() {
            return { -x, -y, -z, -w };
        }

        public float dot(Vector4f other) {
            return x * other.x +
                y * other.y +
                z * other.z +
                w * other.w;
        }

        public float length() {
            return Math.sqrtf(x*x + y*y + z*z + w*w);
        }

        public float distance(Vector4f other) {
            return (sub(other)).length();
        }

        public float[] to_array() {
            return new float[]{x, y, z, w};
        }

        public string to_string() {
            return @"x=$x;\ty=$y;\tz=$z;\tw=$w";
        }
    }
}
