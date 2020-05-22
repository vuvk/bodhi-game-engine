namespace Bodhi {

    public class Surface {
        private SDL.Video.Surface? surface;
        private bool loaded;

        internal Surface(Bodhi.File file) {
            uint8[] buffer = new uint8[file.get_size()];
            if (file.read_full(buffer) != buffer.length) {
                Engine.get_log().write_error(@"Error when read file $(file.get_filename())");
                return;
            }

            SDL.RWops rwops = new SDL.RWops.from_mem((void*)buffer, buffer.length);

            if (SDLImage.is_bmp(rwops)) {
                surface = SDLImage.load_bmp(rwops);
            } else if (SDLImage.is_png(rwops)) {
                surface = SDLImage.load_png(rwops);
            } else if (SDLImage.is_jpg(rwops)) {
                surface = SDLImage.load_jpg(rwops);
            }

            loaded = (surface != null);
        }
    }

}

