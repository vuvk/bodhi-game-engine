/*
 * Alure1 binding for Vala
 *
 * Copyright 2020 Anton "Vuvk" Shcherbatykh <vuvk69@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="AL/alure.h")]
namespace Alure
{
    [CCode (cname = "alureGetVersion")]
    public void get_version(out uint major, out uint minor);
    [CCode (cname = "alureGetErrorString")]
    public unowned string? get_error_string();

    [CCode (cname = "alureGetDeviceNames")]
    public unowned string?[] get_device_names(bool all, out int count);
    [CCode (cname = "alureFreeDeviceNames")]
    public void free_device_names([CCode (array_length = false)]string?[] names);

    [CCode (cname = "alureInitDevice")]
    public bool init_device(string? name, [CCode (array_length = false)]int[]? attribs);
    [CCode (cname = "alureShutdownDevice")]
    public bool shutdown_device();

    [CCode (cname = "alureGetSampleFormat")]
    public int get_sample_format(uint channels, uint bits, uint floatbits);

    [CCode (cname = "alureSleep")]
    public bool sleep(float duration);

    [CCode (cname = "alureStreamSizeIsMicroSec")]
    public bool stream_size_is_microsec(bool useus);

    [CCode (cname = "alureCreateBufferFromFile")]
    public uint create_buffer_from_file(string fname);
    [CCode (cname = "alureCreateBufferFromMemory")]
    public uint create_buffer_from_memory(uint8[] data);
    [CCode (cname = "alureBufferDataFromFile")]
    public bool buffer_data_from_file(string fname, uint buffer);
    [CCode (cname = "alureBufferDataFromMemory")]
    public bool buffer_data_from_memory(uint8[] fdata, uint buffer);

    public delegate uint CallbackCreateStream(void* userdata, uint8[] data, uint bytes);

    [CCode (cname = "alureStream")]
    [Compact]
    public class Stream {
        [CCode (cname = "alureCreateStreamFromFile")]
        public Stream.from_file(string fname, int chunk_length, int num_bufs, uint[] bufs);
        
        [CCode (cname = "alureCreateStreamFromMemory")]
        public Stream.from_memory(uint8[] data, int chunk_length, int num_bufs, uint[] bufs);
    
        [CCode (cname = "alureCreateStreamFromStaticMemory")]
        public Stream.from_static_memory(uint8[] data, int chunk_length, int num_bufs, uint[] bufs);
        
        [CCode (cname = "alureCreateStreamFromCallback")]
        public Stream.from_callback(CallbackCreateStream callback,
                                    void* userdata, int format, uint samplerate,
                                    int chunk_length, int num_bufs, uint[] bufs);

        [CCode (cname = "alureGetStreamLength")]
        public int64 get_length();

        [CCode (cname = "alureGetStreamFrequency")]
        public int get_frequency();

        [CCode (cname = "alureBufferDataFromStream")]
        public int buffer_data(int num_bufs, uint[] bufs);
        
        [CCode (cname = "alureRewindStream")]
        public bool rewind();
        
        [CCode (cname = "alureSetStreamOrder")]
        public bool set_order(uint order);
        
        [CCode (cname = "alureSetStreamPatchset")]
        public bool set_patchset(string patchset);
        
        [CCode (cname = "alureDestroyStream")]
        public bool destroy(int num_bufs, uint[] bufs);    
    }
    
    [CCode (cname = "alureUpdate")]
    public void update();
    [CCode (cname = "alureUpdateInterval")]
    public bool update_interval(float interval);

    public delegate void Callback(void* userdata, uint source);

    [CCode (cname = "alurePlaySourceStream")]
    public bool play_source_stream(uint source, Stream stream, int num_bufs, int loopcount,
                                   Callback eos_callback, void* userdata);
    [CCode (cname = "alurePlaySource")]
    public bool play_source(uint source, Callback callback, void* userdata);
    [CCode (cname = "alureStopSource")]
    public bool stop_source(uint source, bool run_callback);
    [CCode (cname = "alurePauseSource")]
    public bool pause_source(uint source);
    [CCode (cname = "alureResumeSource")]
    public bool resume_source(uint source);

    public delegate void* OpenFile(string name);
    public delegate void* OpenMem(uint8[] buffer);
    public delegate bool GetFormat(void* instance, out int format, out uint samplerate, out uint blocksize);
    public delegate uint Decode(void* instance, [CCode (array_length = false)]uint8[] data, uint bytes);
    public delegate bool Rewind(void* instance);
    public delegate void Close(void* instance);

    [CCode (cname = "alureInstallDecodeCallbacks")]
    public bool install_decode_callbacks(
        int index,
        OpenFile open_file,
        OpenMem open_mem,
        GetFormat get_format,
        Decode decode,
        Rewind rewind,
        Close close
    );
    
    public delegate void* Open(string filename, uint mode);
    public delegate int Read(void* handle, [CCode (array_length = false)]uint8[] buf, uint bytes);
    public delegate int Write(void* handle, [CCode (array_length = false)]uint8[] buf, uint bytes);
    public delegate int64 Seek(void* handle, int64 offset, int whence);

    [CCode (cname = "alureSetIOCallbacks")]
    public bool set_io_callbacks(
        Open open,
        Close close,
        Read read,
        Write write,
        Seek seek
    );

    [CCode (cname = "alureGetProcAddress")]
    public void* get_proc_address(string funcname);
}