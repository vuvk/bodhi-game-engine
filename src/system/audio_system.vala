namespace Bodhi {
    public class Audio : SubSystem {

        private Listener? listener;

        internal Audio() {
            base();
            subsystem_name = "Audio System";
        }

        ~Audio() {
            deinit();
        }

        protected override Errors init() {
            if (!Engine.is_running()) {
                stderr.printf("I can't create audio system if engine is not started!\n");
                return Errors.ENGINE_NOT_STARTED;
            } else {
                if (Alure.init_device()) {
                    Engine.get_log().write("Audio device initialized!\n");
                    return Errors.NO_ERROR;
                } else {
                    Engine.get_log().write_error(@"Failed to initialize Audio device: $(get_last_error())\n");
                    return Errors.AUDIO_NOT_CREATED;
                }
            }
        }

        internal override void deinit() {
            if (is_initialized()) {
                if (!Alure.shutdown_device()) {
                    Engine.get_log().write_error(@"WOW! Failed to shutdown Audio device: $(get_last_error())\n");
                } else {
                    Engine.get_log().write_warning("Audio device shutdowned!\n");
                    state = States.NOT_INITIALIZED;
                }

                listener = null;
            }
        }

        public bool error_exists() {
            if (is_initialized()) {
                string? error = Alure.get_error_string();

                return (error != null && error.length > 0 && error != "No error");
            }

            return false;
        }

        public string get_last_error() {
            if (error_exists()) {
                return Alure.get_error_string();
            }
            return "";
        }

        public void print_last_error() {
            if (error_exists()) {
                Engine.get_log().write(get_last_error() + "\n");
            }
        }

        public Listener? get_listener() {
            if (is_initialized() && listener == null) {
                listener = new Listener();
            }
            return listener;
        }



        public class Listener {
            private static Audio audio = Engine.get_audio();

            private float[] position    = new float[3];
            private float[] orientation = new float[6];
            private float[] velocity    = new float[3];

            internal Listener() {
                set_positionf   (0.0f, 0.0f,  0.0f);

                set_orientationf(0.0f, 0.0f, -1.0f,
                                 0.0f, 1.0f,  0.0f);

                set_velocityf   (0.0f, 0.0f,  0.0f);
            }
            ~Listener() {}

            public void set_position(float[] position) {
                if (position.length > 2) {
                    set_positionf(position[0], position[1], position[2]);
                }
            }

            public void set_positionv(Vector3f position) {
                set_positionf(position.x, position.y, position.z);
            }

            public void set_positionf(float x, float y, float z) {
                if (!audio.is_initialized()) {
                    return;
                }

                position[0] = x;
                position[1] = y;
                position[2] = z;

                AL.Listener.set_paramfv(AL.POSITION, position);
            }

            public void set_orientation(float[] orientation) {
                if (orientation.length > 5) {
                    set_orientationf(orientation[0], orientation[1], orientation[2],
                                     orientation[3], orientation[4], orientation[5]);
                }
            }

            public void set_orientationv(Vector3f at, Vector3f up) {
                set_orientationf(at.x, at.y, at.z, up.x, up.y, up.z);
            }

            public void set_orientationf(float tX, float tY, float tZ,
                                         float uX, float uY, float uZ) {
                if (!audio.is_initialized()) {
                    return;
                }

                orientation[0] = tX;
                orientation[1] = tY;
                orientation[2] = tZ;
                orientation[3] = uX;
                orientation[4] = uY;
                orientation[5] = uZ;

                AL.Listener.set_paramfv(AL.ORIENTATION, orientation);
            }

            public void set_velocity(float[] velocity) {
                if (velocity.length > 2) {
                    set_velocityf(velocity[0], velocity[1], velocity[2]);
                }
            }

            public void set_velocityv(Vector3f velocity) {
                set_velocityf(velocity.x, velocity.y, velocity.z);
            }

            public void set_velocityf(float x, float y, float z) {
                if (!audio.is_initialized()) {
                    return;
                }

                velocity[0] = x;
                velocity[1] = y;
                velocity[2] = z;

                AL.Listener.set_paramfv(AL.VELOCITY, velocity);
            }

            public float[] get_position() {
                if (!audio.is_initialized()) {
                    return {0,0,0};
                }

                return position[0:3];
            }

            public Vector3f get_positionv() {
                if (!audio.is_initialized()) {
                    return Vector3f.ZERO();
                }

                return Vector3f.from_array(position);
            }

            public void get_positionf(out float x, out float y, out float z) {
                if (!audio.is_initialized()) {
                    return;
                }

                x = position[0];
                y = position[1];
                z = position[2];
            }

            public float[] get_orientation() {
                if (!audio.is_initialized()) {
                    return {0,0,0,0,0,0};
                }

                return orientation[0:6];
            }

            public Vector3f get_orientationv_at() {
                if (!audio.is_initialized()) {
                    return Vector3f.ZERO();
                }

                return Vector3f(orientation[0], orientation[1], orientation[2]);
            }

            public Vector3f get_orientationv_up() {
                if (!audio.is_initialized()) {
                    return Vector3f.ZERO();
                }

                return Vector3f(orientation[3], orientation[4], orientation[5]);
            }

            public void get_orientationv(ref Vector3f at, ref Vector3f up) {
                if (!audio.is_initialized()) {
                    return;
                }

                at.x = orientation[0];
                at.y = orientation[1];
                at.z = orientation[2];

                up.x = orientation[3];
                up.y = orientation[4];
                up.z = orientation[5];
            }

            public float[] get_velocity() {
                if (!audio.is_initialized()) {
                    return {0,0,0};
                }

                return velocity[0:3];
            }

            public Vector3f get_velocityv() {
                if (!audio.is_initialized()) {
                    return Vector3f.ZERO();
                }

                return Vector3f.from_array(velocity);
            }

            public void get_velocityf(out float x, out float y, out float z) {
                if (!audio.is_initialized()) {
                    return;
                }

                x = velocity[0];
                y = velocity[1];
                z = velocity[2];
            }
        }
    }
}
