namespace Bodhi {

    public class MathUtil {

        private const float DEG_TO_RAD_COEFF = (float)(Math.PI / 180.0);
        private const float RAD_TO_DEG_COEFF = (float)(180.0 / Math.PI);

        public static float deg_to_rad(float deg) {
            return deg * DEG_TO_RAD_COEFF;
        }

        public static float rad_to_deg(float rad) {
            return rad * RAD_TO_DEG_COEFF;
        }

        private MathUtil() {}
        ~MathUtil() {}
    }

}
