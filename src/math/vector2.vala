
/** vector with 2 integer components */
public class Vector2i : Object {
    public int x {get; set;}
    public int y {get; set;}

    public Vector2i(int x, int y) {
        set_xy(x, y);
    }

    public Vector2i.zero() {
        this(0, 0);
    }

    public Vector2i.one() {
        this(1, 1);
    }

    public Vector2i.from_v2i(Vector2i other) {
        this(other.x, other.y);
    }

    public void set_xy(int x, int y) {
        this.x = x;
        this.y = y;
    }
}

/** vector with 2 floats components */
public class Vector2f : Object {
    public double x {get; set;}
    public double y {get; set;}

    public Vector2f(double x, double y) {
        set_xy(x, y);
    }

    public Vector2f.zero() {
        this(0, 0);
    }

    public Vector2f.one() {
        this(1, 1);
    }

    public Vector2f.from_v2f(Vector2f other) {
        this(other.x, other.y);
    }
    
    public Vector2f.from_array(double[] components) {
        this(components[0], components[1]);
    }

    public void set_xy(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public Vector2f add(Vector2f other) {
        return new Vector2f(x + other.x, y + other.y);
    }
    
    public Vector2f sub(Vector2f other) {
        return new Vector2f(x - other.x, y - other.y);
    }
    
    public Vector2f mul(double value) {
        return new Vector2f(x * value, y * value);
    }
    
    public Vector2f div(double value) {
        if (value != 0.0) {
            value = 1.0 / value;
            return new Vector2f(x * value, y * value);
        } else {
            return new Vector2f.zero();
        }
    }
    
    public Vector2f neg() {
        return new Vector2f(-x, -y);
    }
    
    public double dot(Vector2f other) {
        return x * other.x + y * other.y;
    }
    
    public Vector2f normalize() {
        return div(length());
    }
    
    public double length() {
        return Math.sqrt(x*x + y*y);
    }
    
    public double distance(Vector2f other) {
        return (this.sub(other)).length();
    }

    public double[] to_array() {
        return new double[]{x, y};
    }
}