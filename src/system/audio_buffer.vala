using Gee;

namespace Bodhi {

    class AudioBuffer : Object {

        internal static ArrayList<AudioBuffer> LIB = new ArrayList<AudioBuffer>();

        private string file_name = "";
        AL.Buffer buffer = 0;
        bool streaming = false;

        internal AudioBuffer(string file_name, bool streaming = false) {
            LIB.add(this);
            load(file_name, streaming);
        }

        ~AudioBuffer() {
            LIB.remove(this);
        }

        public void load(string file_name, bool streaming = false) {
        }

        public void unload() {
        }

        public bool is_loaded() {
            return buffer != 0;
        }

        internal AL.Buffer get_buffer() {
            return buffer;
        }

        public string get_file_name() {
            return file_name;
        }

        public bool is_streaming() {
            return streaming;
        }
    }
}
