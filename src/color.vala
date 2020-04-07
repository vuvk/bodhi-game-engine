namespace Bodhi {
    public struct RGBColor {
        public uint8 r;
        public uint8 g;
        public uint8 b;

        public static RGBColor RED()   { return { 255, 0,   0   }; }
        public static RGBColor GREEN() { return { 0,   255, 0   }; }
        public static RGBColor BLUE()  { return { 0,   0,   255 }; }
        public static RGBColor BLACK() { return { 0,   0,   0   }; }
        public static RGBColor WHITE() { return { 255, 255, 255 }; }

        public RGBColor(uint8 r, uint8 g, uint8 b) {
            set_rgb(r, g, b);
        }

        public uint8 get_r() {
            return r;
        }

        public uint8 get_g() {
            return g;
        }

        public uint8 get_b() {
            return b;
        }

        public void set_r(uint8 r) {
            this.r = r;
        }

        public void set_g(uint8 g) {
            this.g = g;
        }

        public void set_b(uint8 b) {
            this.b = b;
        }

        public void set_rgb(uint8 r, uint8 g, uint8 b) {
            set_r(r);
            set_g(g);
            set_b(b);
        }

        public RGBColor add(RGBColor other) {
            int _r = (r + other.r).clamp(0,255);
            int _g = (g + other.g).clamp(0,255);
            int _b = (b + other.b).clamp(0,255); 
            
            return { (uint8)_r, (uint8)_g, (uint8)_b };
        }

        public RGBColor sub(RGBColor other) {
            int _r = (r - other.r).clamp(0,255);
            int _g = (g - other.g).clamp(0,255);
            int _b = (b - other.b).clamp(0,255); 
            
            return { (uint8)_r, (uint8)_g, (uint8)_b };
        }

        public RGBColor mul(float scalar) {
            int _r = ((int)(r * scalar)).clamp(0,255);
            int _g = ((int)(g * scalar)).clamp(0,255);
            int _b = ((int)(b * scalar)).clamp(0,255);         
            
            return { (uint8)_r, (uint8)_g, (uint8)_b };
        }

        public RGBColor div(float scalar) {
            if (scalar != 0.0f) {
                scalar = 1.0f / scalar;
            } else {
                scalar = 0.0f;
            }
            return mul(scalar);       
        }
    }

    public struct RGBAColor {
        public uint8 r;
        public uint8 g;
        public uint8 b;
        public uint8 a;

        public static RGBAColor RED()   { return { 255, 0,   0,   255 }; }
        public static RGBAColor GREEN() { return { 0,   255, 0,   255 }; }
        public static RGBAColor BLUE()  { return { 0,   0,   255, 255 }; }
        public static RGBAColor BLACK() { return { 0,   0,   0,   255 }; }
        public static RGBAColor WHITE() { return { 255, 255, 255, 255 }; }

        public RGBAColor(uint8 r, uint8 g, uint8 b, uint8 a) {
            set_rgba(r, g, b, a);
        }

        public uint8 get_r() {
            return r;
        }

        public uint8 get_g() {
            return g;
        }

        public uint8 get_b() {
            return b;
        }

        public uint8 get_a() {
            return a;
        }

        public void set_r(uint8 r) {
            this.r = r;
        }

        public void set_g(uint8 g) {
            this.g = g;
        }

        public void set_b(uint8 b) {
            this.b = b;
        }

        public void set_a(uint8 a) {
            this.a = a;
        }

        public void set_rgba(uint8 r, uint8 g, uint8 b, uint8 a) {
            set_r(r);
            set_g(g);
            set_b(b);
            set_a(a);
        }

        public RGBAColor add(RGBAColor other) {
            int _r = (r + other.r).clamp(0,255);
            int _g = (g + other.g).clamp(0,255);
            int _b = (b + other.b).clamp(0,255); 
            int _a = (a + other.a).clamp(0,255); 
            
            return { (uint8)_r, (uint8)_g, (uint8)_b, (uint8)_a };
        }

        public RGBAColor sub(RGBAColor other) {
            int _r = (r - other.r).clamp(0,255);
            int _g = (g - other.g).clamp(0,255);
            int _b = (b - other.b).clamp(0,255); 
            int _a = (a - other.a).clamp(0,255); 
            
            return { (uint8)_r, (uint8)_g, (uint8)_b, (uint8)_a };
        }

        public RGBAColor mul(float scalar) {
            int _r = ((int)(r * scalar)).clamp(0,255);
            int _g = ((int)(g * scalar)).clamp(0,255);
            int _b = ((int)(b * scalar)).clamp(0,255);    
            int _a = ((int)(a * scalar)).clamp(0,255);           
            
            return { (uint8)_r, (uint8)_g, (uint8)_b, (uint8)_a };
        }

        public RGBAColor div(float scalar) {
            if (scalar != 0.0f) {
                scalar = 1.0f / scalar;
            } else {
                scalar = 0.0f;
            }
            return mul(scalar);       
        }
    }

    public struct RGBColorf {
        public float r;
        public float g;
        public float b;

        public static RGBColorf RED()   { return { 1, 0, 0 }; }
        public static RGBColorf GREEN() { return { 0, 1, 0 }; }
        public static RGBColorf BLUE()  { return { 0, 0, 1 }; }
        public static RGBColorf BLACK() { return { 0, 0, 0 }; }
        public static RGBColorf WHITE() { return { 1, 1, 1 }; }

        public RGBColorf(float r, float g, float b) {
            set_rgb(r, g, b);
        }

        public float get_r() {
            return r;
        }

        public float get_g() {
            return g;
        }

        public float get_b() {
            return b;
        }

        public void set_r(float r) {
            this.r = r.clamp(0.0f, 1.0f);
        }

        public void set_g(float g) {
            this.g = g.clamp(0.0f, 1.0f);
        }

        public void set_b(float b) {
            this.b = b.clamp(0.0f, 1.0f);
        }

        public void set_rgb(float r, float g, float b) {
            set_r(r);
            set_g(g);
            set_b(b);
        }

        public RGBColorf add(RGBColorf other) {
            float _r = r + other.r;
            float _g = g + other.g;
            float _b = b + other.b; 
            
            return RGBColorf(_r, _g, _b);
        }

        public RGBColorf sub(RGBColorf other) {
            float _r = r - other.r;
            float _g = g - other.g;
            float _b = b - other.b; 
            
            return RGBColorf(_r, _g, _b);
        }

        public RGBColorf mul(float scalar) {
            float _r = r * scalar;
            float _g = g * scalar;
            float _b = b * scalar;        
            
            return RGBColorf(_r, _g, _b);
        }

        public RGBColorf div(float scalar) {
            if (scalar != 0.0f) {
                scalar = 1.0f / scalar;
            } else {
                scalar = 0.0f;
            }
            return mul(scalar);       
        }
    }

    public struct RGBAColorf {
        public float r;
        public float g;
        public float b;
        public float a;

        public static RGBAColorf RED()   { return { 1, 0, 0, 1 }; }
        public static RGBAColorf GREEN() { return { 0, 1, 0, 1 }; }
        public static RGBAColorf BLUE()  { return { 0, 0, 1, 1 }; }
        public static RGBAColorf BLACK() { return { 0, 0, 0, 1 }; }
        public static RGBAColorf WHITE() { return { 1, 1, 1, 1 }; }

        public RGBAColorf(float r, float g, float b, float a) {
            set_rgba(r, g, b, a);
        }

        public float get_r() {
            return r;
        }

        public float get_g() {
            return g;
        }

        public float get_b() {
            return b;
        }

        public float get_a() {
            return a;
        }

        public void set_r(float r) {
            this.r = r.clamp(0.0f, 1.0f);
        }

        public void set_g(float g) {
            this.g = g.clamp(0.0f, 1.0f);
        }

        public void set_b(float b) {
            this.b = b.clamp(0.0f, 1.0f);
        }

        public void set_a(float a) {
            this.a = a.clamp(0.0f, 1.0f);
        }

        public void set_rgba(float r, float g, float b, float a) {
            set_r(r);
            set_g(g);
            set_b(b);
            set_a(a);
        }

        public RGBAColorf add(RGBAColorf other) {
            float _r = r + other.r;
            float _g = g + other.g;
            float _b = b + other.b; 
            float _a = a + other.a; 
            
            return RGBAColorf(_r, _g, _b, _a);
        }

        public RGBAColorf sub(RGBAColorf other) {
            float _r = r - other.r;
            float _g = g - other.g;
            float _b = b - other.b; 
            float _a = a - other.a; 
            
            return RGBAColorf(_r, _g, _b, _a);
        }

        public RGBAColorf mul(float scalar) {
            float _r = r * scalar;
            float _g = g * scalar;
            float _b = b * scalar;
            float _a = a * scalar;           
            
            return RGBAColorf(_r, _g, _b, _a);
        }

        public RGBAColorf div(float scalar) {
            if (scalar != 0.0f) {
                scalar = 1.0f / scalar;
            } else {
                scalar = 0.0f;
            }
            return mul(scalar);       
        }
    }
}