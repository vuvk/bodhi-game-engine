public class Matrix4 : Object {
    private double[] data = new double[16];

    public Matrix4() {
    }

    public Matrix4.from_identity() {
        identity();
    }

    public Matrix4.from_array(double[] data) {
        this();
        set_array(data);
    }

    public double[] get_array() {
        return data[0:16];
    }

    public void set_array(double[] data) {
        if (data.length >= 16) {
            this.data = data[0:16];
        }
    }
    
    public void identity() {
        data[1]  = data[2]  = data[3]  = data[4]  =
        data[6]  = data[7]  = data[8]  = data[9]  =
        data[11] = data[12] = data[13] = data[14] = 0.0;

        data[0] = data[5] = data[10] = data[15] = 1.0;
    }
    
    public Matrix4 cpy() {
        return new Matrix4.from_array(data);     
    }

    public Matrix4 mul(double scalar) {
        Matrix4 tmp = this.cpy();
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

        double[] temp = new double[4];
        for (int i = 0; i < 4; ++i) {
            temp[i] = data[i]      * vec.x +
                      data[4 + i]  * vec.y +
                      data[8 + i]  * vec.z +
                      data[12 + i] * vec.w;
        }

        double[] result = temp[0:4];
        if (result[3] != 0.0 && result[3] != 1.0) {
            double w;
            if (temp[3] != 0.0) {
                w = 1.0 / temp[3];
            } else {
                w = 1.0;
            }

            for (int i = 0; i < 4; ++i) {
                result[i] *= w;
            }
        }

        return new Vector4f.from_array(result);
    }
    
    public Matrix4 mul_mtx(Matrix4 other) {
        Matrix4 tmp = new Matrix4();
        for (int col = 0; col < 4; ++col) {
                for (int row = 0; row < 4; ++row) {
                    for (int i = 0; i < 4; ++i) {
                        tmp.data[col * 4 + row] += data[i * 4 + row] * other.data[col * 4 + i];
                    }
                }
        }
        return tmp;
    }
}
