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
        this.r = r;
        this.g = g;
        this.b = b;
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

    public RGBColor mul(double scalar) {
        int _r = ((int)(r * scalar)).clamp(0,255);
        int _g = ((int)(g * scalar)).clamp(0,255);
        int _b = ((int)(b * scalar)).clamp(0,255);         
        
        return { (uint8)_r, (uint8)_g, (uint8)_b };
    }

    public RGBColor div(double scalar) {
        if (scalar != 0.0) {
            scalar = 1.0 / scalar;
        } else {
            scalar = 0.0;
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
        this.r = r;
        this.g = g;
        this.b = b;
        this.a = a;
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

    public RGBAColor mul(double scalar) {
        int _r = ((int)(r * scalar)).clamp(0,255);
        int _g = ((int)(g * scalar)).clamp(0,255);
        int _b = ((int)(b * scalar)).clamp(0,255);    
        int _a = ((int)(a * scalar)).clamp(0,255);           
        
        return { (uint8)_r, (uint8)_g, (uint8)_b, (uint8)_a };
    }

    public RGBAColor div(double scalar) {
        if (scalar != 0.0) {
            scalar = 1.0 / scalar;
        } else {
            scalar = 0.0;
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
        this.r = r;
        this.g = g;
        this.b = b;
    }

    public RGBColorf add(RGBColorf other) {
        float _r = (r + other.r).clamp(0.0f, 1.0f);
        float _g = (g + other.g).clamp(0.0f, 1.0f);
        float _b = (b + other.b).clamp(0.0f, 1.0f); 
        
        return { _r, _g, _b };
    }

    public RGBColorf sub(RGBColorf other) {
        float _r = (r - other.r).clamp(0.0f, 1.0f);
        float _g = (g - other.g).clamp(0.0f, 1.0f);
        float _b = (b - other.b).clamp(0.0f, 1.0f); 
        
        return { _r, _g, _b };
    }

    public RGBColorf mul(double scalar) {
        float _r = (float)(r * scalar).clamp(0.0f, 1.0f);
        float _g = (float)(g * scalar).clamp(0.0f, 1.0f);
        float _b = (float)(b * scalar).clamp(0.0f, 1.0f);         
        
        return { _r, _g, _b };
    }

    public RGBColorf div(double scalar) {
        if (scalar != 0.0) {
            scalar = 1.0 / scalar;
        } else {
            scalar = 0.0;
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
        this.r = r;
        this.g = g;
        this.b = b;
        this.a = a;
    }

    public RGBAColorf add(RGBAColorf other) {
        float _r = (r + other.r).clamp(0.0f, 1.0f);
        float _g = (g + other.g).clamp(0.0f, 1.0f);
        float _b = (b + other.b).clamp(0.0f, 1.0f); 
        float _a = (a + other.a).clamp(0.0f, 1.0f); 
        
        return { _r, _g, _b, _a };
    }

    public RGBAColorf sub(RGBAColorf other) {
        float _r = (r - other.r).clamp(0.0f, 1.0f);
        float _g = (g - other.g).clamp(0.0f, 1.0f);
        float _b = (b - other.b).clamp(0.0f, 1.0f); 
        float _a = (a - other.a).clamp(0.0f, 1.0f); 
        
        return { _r, _g, _b, _a };
    }

    public RGBAColorf mul(double scalar) {
        float _r = (float)(r * scalar).clamp(0.0f, 1.0f);
        float _g = (float)(g * scalar).clamp(0.0f, 1.0f);
        float _b = (float)(b * scalar).clamp(0.0f, 1.0f);
        float _a = (float)(a * scalar).clamp(0.0f, 1.0f);           
        
        return { _r, _g, _b, _a };
    }

    public RGBAColorf div(double scalar) {
        if (scalar != 0.0) {
            scalar = 1.0 / scalar;
        } else {
            scalar = 0.0;
        }
        return mul(scalar);       
    }
}