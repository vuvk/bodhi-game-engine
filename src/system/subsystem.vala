namespace Bodhi {
    public abstract class SubSystem : Object {

        public enum States {
            NOT_INITIALIZED,
            INITIALIZED;
        }

        protected string subsystem_name = "abstract";
        protected States state = States.NOT_INITIALIZED;

        internal SubSystem() {
            if (init() == Errors.NO_ERROR) {
                state = States.INITIALIZED;
            }
        }

        ~SubSystem() {
            deinit();
        }

        protected abstract Errors init();

        internal virtual void deinit() {
            if (is_initialized()) {
                state = States.NOT_INITIALIZED;
                Engine.get_log().write_warning(@"$subsystem_name shutdowned!\n");
            }
        }

        public States get_state() {
            return state;
        }

        public bool is_initialized() {
            return state == States.INITIALIZED;
        }
    }
}
