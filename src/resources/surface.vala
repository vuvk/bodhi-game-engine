namespace Bodhi {

    public class Surface {
        private static SDL.Video.Surface? ethalon_surface;
        static construct {
            uint32 rmask, gmask, bmask, amask;

            rmask = (uint32)0x000000ff;
            gmask = (uint32)0x0000ff00;
            bmask = (uint32)0x00ff0000;
            amask = (uint32)0xff000000;

            ethalon_surface = new SDL.Video.Surface.legacy_rgb (0, 1, 1, 32, rmask, gmask, bmask, amask);
            if (ethalon_surface == null) {
                stderr.printf("SDL_CreateRGBSurface() failed: %s", SDL.get_error());
            }
        }

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

            if (surface != null) {
                surface = surface.convert(ethalon_surface.format, 0);
            }

            loaded = (surface != null);
        }

        public bool is_loaded() {
            return loaded;
        }
    }

}

