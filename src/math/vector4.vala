public class Vector4f {
    public double x {get; set;}
    public double y {get; set;}
    public double z {get; set;}
    public double w {get; set;}
    
    public Vector4f.zero() {
        this(0, 0, 0, 1);
    }    
    
    public Vector4f(double x, double y, double z, double w) {
        set_xyzw(x, y, z, w);
    }
    
    public Vector4f.from_v2f(Vector2f other) {
        this(other.x, other.y, 0.0, 1.0);
    }
    
    public Vector4f.from_v3f(Vector3f other) {
        this(other.x, other.y, other.z, 1.0);
    }
    
    public Vector4f.from_v4f(Vector4f other) {
        this(other.x, other.y, other.z, other.w);
    }
    
    public Vector4f.from_array(double[] components) {
        this(components[0], components[1], components[2], components[3]);
    }
    
    public void set_xyzw(double x, double y, double z, double w) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
    }   
    
    public Vector4f add_v2f(Vector2f other) {
        return new Vector4f(x + other.x, y + other.y, z, w);
    }
    
    public Vector4f add_v3f(Vector3f other) {
        return new Vector4f(x + other.x, y + other.y, z + other.z, w);
    }
    
    public Vector4f add(Vector4f other) {
        return new Vector4f(x + other.x, y + other.y, z + other.z, w + other.w);
    }
    
    public Vector4f sub_v2f(Vector2f other) {
        return new Vector4f(x - other.x, y - other.y, z, w);
    }
    
    public Vector4f sub_v3f(Vector3f other) {
        return new Vector4f(x - other.x, y - other.y, z - other.z, w);
    }
    
    public Vector4f sub(Vector4f other) {
        return new Vector4f(x - other.x, y - other.y, z - other.z, w - other.w);
    }
    
    public Vector4f mul(double value) {
        return new Vector4f(x * value, y * value, z * value, w * value);
    }
    
    public Vector4f div(double value) {
        if (value != 0.0) {
            value = 1.0 / value;
            return new Vector4f(x * value, y * value, z * value, w * value);
        } else {
            return new Vector4f.zero();
        }
    }
    
    public Vector4f neg() {
        return new Vector4f(-x, -y, -z, -w);
    }
    
    public double dot(Vector4f other) {
        return x * other.x + 
               y * other.y + 
               z * other.z + 
               w * other.w;
    }
    
    public double length() {
        return Math.sqrt(x*x + y*y + z*z + w*w);
    }
    
    public double distance(Vector4f other) {
        return (this.sub(other)).length();
    }
    
    public double[] to_array() {
        return new double[]{x, y, z, w};
    }
}