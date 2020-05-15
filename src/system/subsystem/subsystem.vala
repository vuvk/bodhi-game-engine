namespace Bodhi {
    public abstract class SubSystem : Object {

        public enum State {
            NOT_INITIALIZED,
            INITIALIZED;
        }

        protected string subsystem_name = "abstract";
        protected State state = State.NOT_INITIALIZED;

        internal SubSystem() {
            if (init() == Errors.NO_ERROR) {
                state = State.INITIALIZED;
            }
        }

        ~SubSystem() {
            deinit();
        }

        protected abstract Errors init();

        internal virtual void deinit() {
            if (is_initialized()) {
                state = State.NOT_INITIALIZED;
                Engine.get_log().write_warning(@"$subsystem_name shutdowned!\n");
            }
        }

        public State get_state() {
            return state;
        }

        public bool is_initialized() {
            return state == State.INITIALIZED;
        }
    }
}
