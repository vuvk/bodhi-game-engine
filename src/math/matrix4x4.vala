public class Matrix4x4 : Object {
    private float[] data;

    public Matrix4x4() {
        data = new float[16];
    }

    public Matrix4x4.from_identity() {
        this();
        identity();
    }

    public Matrix4x4.from_array(float[] data) {
        this.from_identity();
        set_array(data);
    }

    public float[] get_array() {
        unowned float[] array = data[0:16];
        return array;
    }

    public void set_array(float[] data) {
        if (data.length >= 16) {
            this.data = data[0:16];
        }
    }
    
    public void identity() {
        data[1]  = data[2]  = data[3]  = data[4]  =
        data[6]  = data[7]  = data[8]  = data[9]  =
        data[11] = data[12] = data[13] = data[14] = 0.0f;

        data[0] = data[5] = data[10] = data[15] = 1.0f;
    }
    
    public Matrix4x4 cpy() {
        return new Matrix4x4.from_array(data);     
    }

    public Matrix4x4 mul(float scalar) {
        Matrix4x4 tmp = this.cpy();
        for (int i = 0; i < data.length; ++i) {
            tmp.data[i] *= scalar;            
        }
        return tmp;
    }
    
    public Vector4f mul_v4f(Vector4f vec) {
    /*
        | a b c d |   | x |     | a*x + b*y + c*z + d*w |
        | e f g h | * | y |  =  | e*x + f*y + g*z + h*w |
        | i j k l |   | z |     | i*x + j*y + k*z + l*w |
        | m n o q |   | w |     | m*x + n*y + o*z + q*w |
    */

        float[] temp = new float[4];
        for (int i = 0; i < 4; ++i) {
            temp[i] = data[     i] * vec.x +
                      data[ 4 + i] * vec.y +
                      data[ 8 + i] * vec.z +
                      data[12 + i] * vec.w;
        }

        unowned float[] result = temp[0:4];
        if (result[3] != 0.0f && result[3] != 1.0f) {
            float w;
            if (temp[3] != 0.0f) {
                w = 1.0f / temp[3];
            } else {
                w = 1.0f;
            }

            for (int i = 0; i < 4; ++i) {
                result[i] *= w;
            }
        }

        return Vector4f.from_array(result);
    }
    
    public Matrix4x4 mul_mtx(Matrix4x4 other) {
        Matrix4x4 tmp = new Matrix4x4();
        for (int col = 0; col < 4; ++col) {
                for (int row = 0; row < 4; ++row) {
                    for (int i = 0; i < 4; ++i) {
                        tmp.data[col << 2 + row] += data[i << 2 + row] * other.data[col << 2 + i];
                    }
                }
        }
        return tmp;
    }
}
