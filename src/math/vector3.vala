

/** vector with 3 float components */
[SimpleType]
public struct Vector3f {
    public float x {get; set;}
    public float y {get; set;}
    public float z {get; set;}

    public static Vector3f ZERO = { 0, 0, 0 };
    public static Vector3f ONE  = { 1, 1, 1 };

    public static Vector3f RIGHT   = { 1, 0, 0 };
    public static Vector3f UP      = { 0, 1, 0 };
    public static Vector3f FORWARD = { 0, 0, 1 };
    
    public Vector3f(float x, float y, float z) {
        set_xyz(x, y, z);
    }
    
    public Vector3f.from_v2f(Vector2f other) {
        this(other.x, other.y, 0.0f);
    }
    
    public Vector3f.from_v3f(Vector3f other) {
        this(other.x, other.y, other.z);
    }
    
    public Vector3f.from_v4f(Vector4f other) {      
        float w;
        if (other.w != 0.0f)
            w = 1.0f / other.w;
        else
            w = 0.0f;

        x = other.x * w;
        y = other.y * w;
        z = other.z * w;
    }
    
    public Vector3f.from_array(float[] components) {
        this(components[0], components[1], components[2]);
    }
    
    public void set_xyz(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }   
    
    public Vector3f add_v2f(Vector2f other) {
        return { x + other.x, y + other.y, z };
    }
    
    public Vector3f add(Vector3f other) {
        return { x + other.x, y + other.y, z + other.z };
    }
    
    public Vector3f sub_v2f(Vector2f other) {
        return { x - other.x, y - other.y, z };
    }
    
    public Vector3f sub(Vector3f other) {
        return { x - other.x, y - other.y, z - other.z };
    }
    
    public Vector3f mul(float value) {
        return { x * value, y * value, z * value };
    }
    
    public Vector3f div(float value) {
        if (value != 0.0) {
            value = 1.0 / value;
            return { x * value, y * value, z * value };
        } else {
            return ZERO;
        }
    }
    
    public Vector3f neg() {
        return { -x, -y, -z };
    }
    
    public float dot(Vector3f other) {
        return x * other.x + 
               y * other.y + 
               z * other.z;
    }
    
    public float length() {
        return Math.sqrtf(x*x + y*y + z*z);
    }
    
    public float distance(Vector3f other) {
        return (this.sub(other)).length();
    }
    
    public Vector3f cross(Vector3f other) {
        return { 
            y * other.z - z * other.y,
            z * other.x - x * other.z,
            x * other.y - y * other.x
        };
    }

    public Vector3f normalize() {
        return div(length());
    }
        
    public float[] to_array() {
        return new float[]{x, y, z};
    }
}