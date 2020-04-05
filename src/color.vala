namespace Bodhi {
    public struct RGBColor {
        public uint8 r;
        public uint8 g;
        public uint8 b;

        public const RGBColor RED   = { 255, 0,   0   };
        public const RGBColor GREEN = { 0,   255, 0   };
        public const RGBColor BLUE  = { 0,   0,   255 };
        public const RGBColor BLACK = { 0,   0,   0   };
        public const RGBColor WHITE = { 255, 255, 255 };

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

        public const RGBAColor RED   = { 255, 0,   0,   255 };
        public const RGBAColor GREEN = { 0,   255, 0,   255 };
        public const RGBAColor BLUE  = { 0,   0,   255, 255 };
        public const RGBAColor BLACK = { 0,   0,   0,   255 };
        public const RGBAColor WHITE = { 255, 255, 255, 255 };

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

        public const RGBColorf RED   = { 1, 0, 0 };
        public const RGBColorf GREEN = { 0, 1, 0 };
        public const RGBColorf BLUE  = { 0, 0, 1 };
        public const RGBColorf BLACK = { 0, 0, 0 };
        public const RGBColorf WHITE = { 1, 1, 1 };

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

        public const RGBAColorf RED   = { 1, 0, 0, 1 };
        public const RGBAColorf GREEN = { 0, 1, 0, 1 };
        public const RGBAColorf BLUE  = { 0, 0, 1, 1 };
        public const RGBAColorf BLACK = { 0, 0, 0, 1 };
        public const RGBAColorf WHITE = { 1, 1, 1, 1 };

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