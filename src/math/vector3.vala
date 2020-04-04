

/** vector with 3 float components */
public class Vector3f {
    public double x {get; set;}
    public double y {get; set;}
    public double z {get; set;}

    public static Vector3f RIGHT   = new Vector3f(1, 0, 0);
    public static Vector3f UP      = new Vector3f(0, 1, 0);
    public static Vector3f FORWARD = new Vector3f(0, 0, 1);
    
    public Vector3f(double x, double y, double z) {
        set_xyz(x, y, z);
    }
    
    public Vector3f.zero() {
        this(0, 0, 0);
    }
    
    public Vector3f.one() {
        this(1, 1, 1);
    }
    
    public Vector3f.from_v2f(Vector2f other) {
        this(other.x, other.y, 0.0);
    }
    
    public Vector3f.from_v3f(Vector3f other) {
        this(other.x, other.y, other.z);
    }
    
    public Vector3f.from_v4f(Vector4f other) {      
        double w;
        if (other.w != 0.0)
            w = 1.0 / other.w;
        else
            w = 0.0;

        x = other.x * w;
        y = other.y * w;
        z = other.z * w;
    }
    
    public Vector3f.from_array(double[] components) {
        this(components[0], components[1], components[2]);
    }
    
    public void set_xyz(double x, double y, double z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }   
    
    public Vector3f add_v2f(Vector2f other) {
        return new Vector3f(x + other.x, y + other.y, z);
    }
    
    public Vector3f add(Vector3f other) {
        return new Vector3f(x + other.x, y + other.y, z + other.z);
    }
    
    public Vector3f sub_v2f(Vector2f other) {
        return new Vector3f(x - other.x, y - other.y, z);
    }
    
    public Vector3f sub(Vector3f other) {
        return new Vector3f(x - other.x, y - other.y, z - other.z);
    }
    
    public Vector3f mul(double value) {
        return new Vector3f(x * value, y * value, z * value);
    }
    
    public Vector3f div(double value) {
        if (value != 0.0) {
            value = 1.0 / value;
            return new Vector3f(x * value, y * value, z * value);
        } else {
            return new Vector3f.zero();
        }
    }
    
    public Vector3f neg() {
        return new Vector3f(-x, -y, -z);
    }
    
    public double dot(Vector3f other) {
        return x * other.x + 
               y * other.y + 
               z * other.z;
    }
    
    public double length() {
        return Math.sqrt(x*x + y*y + z*z);
    }
    
    public double distance(Vector3f other) {
        return (this.sub(other)).length();
    }
    
    public Vector3f cross(Vector3f other) {
        return new Vector3f(
            y * other.z - z * other.y,
            z * other.x - x * other.z,
            x * other.y - y * other.x
        );
    }

    public Vector3f normalize() {
        return div(length());
    }
        
    public double[] to_array() {
        return new double[]{x, y, z};
    }
}