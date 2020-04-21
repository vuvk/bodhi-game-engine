/*
 * OpenAL bindings for Vala
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

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="AL/al.h")]
namespace AL 
{
    // 8-bit boolean
    [CCode (cname="ALboolean")]
    public struct ALboolean : int8 { }
    
    // character
    [CCode (cname="ALchar")]
    public struct ALchar : char { }
    
    // signed 8-bit 2's complement integer
    [CCode (cname="ALbyte")]
    public struct ALbyte : int8 { }
    
    // unsigned 8-bit integer
    [CCode (cname="ALubyte")]
    public struct ALubyte : uint8 { }
    
    // signed 16-bit 2's complement integer
    [CCode (cname="ALshort")]
    public struct ALshort : int16 { }
    
    // unsigned 16-bit integer
    [CCode (cname="ALushort")]
    public struct ALushort : uint16 { }
    
    // signed 32-bit 2's complement integer
    [CCode (cname="ALint")]
    public struct ALint : int32 { }
    
    // unsigned 32-bit integer
    [CCode (cname="ALuint")]
    public struct ALuint : uint32 { }
    
    // non-negative 32-bit binary integer size
    [CCode (cname="ALsizei")]
    public struct ALsizei : int32 { }
    
    // enumerated 32-bit value
    [CCode (cname="ALenum")]
    public struct ALenum : int32 { }
    
    // 32-bit IEEE754 floating-point
    [CCode (cname="ALfloat")]
    public struct ALfloat : float { }
    
    // 64-bit IEEE754 floating-point
    [CCode (cname="ALdouble")]
    public struct ALdouble : double { }
    
    // void type (for opaque pointers only)
    [CCode (cname="ALvoid")]
    public struct ALvoid { }
        
    /** "no distance model" or "no buffer" */
    [CCode (cname="AL_NONE")]
    public const int NONE;
    
    /** Boolean False. */
    [CCode (cname="AL_FALSE")]
    public const int FALSE;
    
    /** Boolean True. */
    [CCode (cname="AL_TRUE")]
    public const int TRUE;

    /**
    * Relative source.
    * Type:    ALboolean
    * Range:   [AL_TRUE, AL_FALSE]
    * Default: AL_FALSE
    *
    * Specifies if the Source has relative coordinates.
    */
    [CCode (cname="AL_SOURCE_RELATIVE")]
    public const int SOURCE_RELATIVE;

    /**
    * Inner cone angle, in degrees.
    * Type:    ALint, ALfloat
    * Range:   [0 - 360]
    * Default: 360
    *
    * The angle covered by the inner cone, where the source will not attenuate.
    */
    [CCode (cname="AL_CONE_INNER_ANGLE")]
    public const int CONE_INNER_ANGLE;

    /**
    * Outer cone angle, in degrees.
    * Range:   [0 - 360]
    * Default: 360
    *
    * The angle covered by the outer cone, where the source will be fully
    * attenuated.
    */
    [CCode (cname="AL_CONE_OUTER_ANGLE")]
    public const int CONE_OUTER_ANGLE;

    /**
    * Source pitch.
    * Type:    ALfloat
    * Range:   [0.5 - 2.0]
    * Default: 1.0
    *
    * A multiplier for the frequency (sample rate) of the source's buffer.
    */
    [CCode (cname="AL_PITCH")]
    public const int PITCH;

    /**
    * Source or listener position.
    * Type:    ALfloat[3], ALint[3]
    * Default: {0, 0, 0}
    *
    * The source or listener location in three dimensional space.
    *
    * OpenAL, like OpenGL, uses a right handed coordinate system, where in a
    * frontal default view X (thumb) points right, Y points up (index finger), and
    * Z points towards the viewer/camera (middle finger).
    *
    * To switch from a left handed coordinate system, flip the sign on the Z
    * coordinate.
    */
    [CCode (cname="AL_POSITION")]
    public const int POSITION;

    /**
    * Source direction.
    * Type:    ALfloat[3], ALint[3]
    * Default: {0, 0, 0}
    *
    * Specifies the current direction in local space.
    * A zero-length vector specifies an omni-directional source (cone is ignored).
    */
    [CCode (cname="AL_DIRECTION")]
    public const int DIRECTION;

    /**
    * Source or listener velocity.
    * Type:    ALfloat[3], ALint[3]
    * Default: {0, 0, 0}
    *
    * Specifies the current velocity in local space.
    */
    [CCode (cname="AL_VELOCITY")]
    public const int VELOCITY;

    /**
    * Source looping.
    * Type:    ALboolean
    * Range:   [AL_TRUE, AL_FALSE]
    * Default: AL_FALSE
    *
    * Specifies whether source is looping.
    */
    [CCode (cname="AL_LOOPING")]
    public const int LOOPING;

    /**
    * Source buffer.
    * Type:  ALuint
    * Range: any valid Buffer.
    *
    * Specifies the buffer to provide sound samples.
    */
    [CCode (cname="AL_BUFFER")]
    public const int BUFFER;

    /**
    * Source or listener gain.
    * Type:  ALfloat
    * Range: [0.0 - ]
    *
    * A value of 1.0 means unattenuated. Each division by 2 equals an attenuation
    * of about -6dB. Each multiplicaton by 2 equals an amplification of about
    * +6dB.
    *
    * A value of 0.0 is meaningless with respect to a logarithmic scale; it is
    * silent.
    */
    [CCode (cname="AL_GAIN")]
    public const int GAIN;

    /**
    * Minimum source gain.
    * Type:  ALfloat
    * Range: [0.0 - 1.0]
    *
    * The minimum gain allowed for a source, after distance and cone attenation is
    * applied (if applicable).
    */
    [CCode (cname="AL_MIN_GAIN")]
    public const int MIN_GAIN;

    /**
    * Maximum source gain.
    * Type:  ALfloat
    * Range: [0.0 - 1.0]
    *
    * The maximum gain allowed for a source, after distance and cone attenation is
    * applied (if applicable).
    */
    [CCode (cname="AL_MAX_GAIN")]
    public const int MAX_GAIN;

    /**
    * Listener orientation.
    * Type: ALfloat[6]
    * Default: {0.0, 0.0, -1.0, 0.0, 1.0, 0.0}
    *
    * Effectively two three dimensional vectors. The first vector is the front (or
    * "at") and the second is the top (or "up").
    *
    * Both vectors are in local space.
    */
    [CCode (cname="AL_ORIENTATION")]
    public const int ORIENTATION;

    /**
    * Source state (query only).
    * Type:  ALint
    * Range: [AL_INITIAL, AL_PLAYING, AL_PAUSED, AL_STOPPED]
    */
    [CCode (cname="AL_SOURCE_STATE")]
    public const int SOURCE_STATE;

    /** Source state value. */
    [CCode (cname="AL_INITIAL")]
    public const int INITIAL;
    [CCode (cname="AL_PLAYING")]
    public const int PLAYING;
    [CCode (cname="AL_PAUSED")]
    public const int PAUSED;
    [CCode (cname="AL_STOPPED")]
    public const int STOPPED;

    /**
    * Source Buffer Queue size (query only).
    * Type: ALint
    *
    * The number of buffers queued using alSourceQueueBuffers, minus the buffers
    * removed with alSourceUnqueueBuffers.
    */
    [CCode (cname="AL_BUFFERS_QUEUED")]
    public const int BUFFERS_QUEUED;

    /**
    * Source Buffer Queue processed count (query only).
    * Type: ALint
    *
    * The number of queued buffers that have been fully processed, and can be
    * removed with alSourceUnqueueBuffers.
    *
    * Looping sources will never fully process buffers because they will be set to
    * play again for when the source loops.
    */
    [CCode (cname="AL_BUFFERS_PROCESSED")]
    public const int BUFFERS_PROCESSED;

    /**
    * Source reference distance.
    * Type:    ALfloat
    * Range:   [0.0 - ]
    * Default: 1.0
    *
    * The distance in units that no attenuation occurs.
    *
    * At 0.0, no distance attenuation ever occurs on non-linear attenuation models.
    */
    [CCode (cname="AL_REFERENCE_DISTANCE")]
    public const int REFERENCE_DISTANCE;

    /**
    * Source rolloff factor.
    * Type:    ALfloat
    * Range:   [0.0 - ]
    * Default: 1.0
    *
    * Multiplier to exaggerate or diminish distance attenuation.
    *
    * At 0.0, no distance attenuation ever occurs.
    */
    [CCode (cname="AL_ROLLOFF_FACTOR")]
    public const int ROLLOFF_FACTOR;

    /**
    * Outer cone gain.
    * Type:    ALfloat
    * Range:   [0.0 - 1.0]
    * Default: 0.0
    *
    * The gain attenuation applied when the listener is outside of the source's
    * outer cone.
    */
    [CCode (cname="AL_CONE_OUTER_GAIN")]
    public const int CONE_OUTER_GAIN;

    /**
    * Source maximum distance.
    * Type:    ALfloat
    * Range:   [0.0 - ]
    * Default: +inf
    *
    * The distance above which the source is not attenuated any further with a
    * clamped distance model, or where attenuation reaches 0.0 gain for linear
    * distance models with a default rolloff factor.
    */
    [CCode (cname="AL_MAX_DISTANCE")]
    public const int MAX_DISTANCE;

    /** Source buffer position, in seconds */
    [CCode (cname="AL_SEC_OFFSET")]
    public const int SEC_OFFSET;
    /** Source buffer position, in sample frames */
    [CCode (cname="AL_SAMPLE_OFFSET")]
    public const int SAMPLE_OFFSET;
    /** Source buffer position, in bytes */
    [CCode (cname="AL_BYTE_OFFSET")]
    public const int BYTE_OFFSET;

    /**
    * Source type (query only).
    * Type:  ALint
    * Range: [AL_STATIC, AL_STREAMING, AL_UNDETERMINED]
    *
    * A Source is Static if a Buffer has been attached using AL_BUFFER.
    *
    * A Source is Streaming if one or more Buffers have been attached using
    * alSourceQueueBuffers.
    *
    * A Source is Undetermined when it has the NULL buffer attached using
    * AL_BUFFER.
    */
    [CCode (cname="AL_SOURCE_TYPE")]
    public const int SOURCE_TYPE;

    /** Source type value. */
    [CCode (cname="AL_STATIC")]
    public const int STATIC;
    [CCode (cname="AL_STREAMING")]
    public const int STREAMING;
    [CCode (cname="AL_UNDETERMINED")]
    public const int UNDETERMINED;

    /** Buffer format specifier. */
    [CCode (cname="AL_FORMAT_MONO8")]
    public const int FORMAT_MONO8;
    [CCode (cname="AL_FORMAT_MONO16")]
    public const int FORMAT_MONO16;
    [CCode (cname="AL_FORMAT_STEREO8")]
    public const int FORMAT_STEREO8;
    [CCode (cname="AL_FORMAT_STEREO16")]
    public const int FORMAT_STEREO16;

    /** Buffer frequency (query only). */
    [CCode (cname="AL_FREQUENCY")]
    public const int FREQUENCY;
    /** Buffer bits per sample (query only). */
    [CCode (cname="AL_BITS")]
    public const int BITS;
    /** Buffer channel count (query only). */
    [CCode (cname="AL_CHANNELS")]
    public const int CHANNELS;
    /** Buffer data size (query only). */
    [CCode (cname="AL_SIZE")]
    public const int SIZE;

    /**
    * Buffer state.
    *
    * Not for public use.
    */
    [CCode (cname="AL_UNUSED")]
    public const int UNUSED;
    [CCode (cname="AL_PENDING")]
    public const int PENDING;
    [CCode (cname="AL_PROCESSED")]
    public const int PROCESSED;

    /** No error. */
    [CCode (cname="AL_NO_ERROR")]
    public const int NO_ERROR;

    /** Invalid name paramater passed to AL call. */
    [CCode (cname="AL_INVALID_NAME")]
    public const int INVALID_NAME;

    /** Invalid enum parameter passed to AL call. */
    [CCode (cname="AL_INVALID_ENUM")]
    public const int INVALID_ENUM;

    /** Invalid value parameter passed to AL call. */
    [CCode (cname="AL_INVALID_VALUE")]
    public const int INVALID_VALUE;

    /** Illegal AL call. */
    [CCode (cname="AL_INVALID_OPERATION")]
    public const int INVALID_OPERATION;

    /** Not enough memory. */
    [CCode (cname="AL_OUT_OF_MEMORY")]
    public const int OUT_OF_MEMORY;

    /** Context string: Vendor ID. */
    [CCode (cname="AL_VENDOR")]
    public const int VENDOR;
    /** Context string: Version. */
    [CCode (cname="AL_VERSION")]
    public const int VERSION;
    /** Context string: Renderer ID. */
    [CCode (cname="AL_RENDERER")]
    public const int RENDERER;
    /** Context string: Space-separated extension list. */
    [CCode (cname="AL_EXTENSIONS")]
    public const int EXTENSIONS;

    /**
    * Doppler scale.
    * Type:    ALfloat
    * Range:   [0.0 - ]
    * Default: 1.0
    *
    * Scale for source and listener velocities.
    */
    [CCode (cname="AL_DOPPLER_FACTOR")]
    public const int DOPPLER_FACTOR;

    /**
    * Doppler velocity (deprecated).
    *
    * A multiplier applied to the Speed of Sound.
    */
    [CCode (cname="AL_DOPPLER_VELOCITY")]
    public const int DOPPLER_VELOCITY;

    /**
    * Speed of Sound, in units per second.
    * Type:    ALfloat
    * Range:   [0.0001 - ]
    * Default: 343.3
    *
    * The speed at which sound waves are assumed to travel, when calculating the
    * doppler effect.
    */
    [CCode (cname="AL_SPEED_OF_SOUND")]
    public const int SPEED_OF_SOUND;

    /**
    * Distance attenuation model.
    * Type:    ALint
    * Range:   [AL_NONE, AL_INVERSE_DISTANCE, AL_INVERSE_DISTANCE_CLAMPED,
    *           AL_LINEAR_DISTANCE, AL_LINEAR_DISTANCE_CLAMPED,
    *           AL_EXPONENT_DISTANCE, AL_EXPONENT_DISTANCE_CLAMPED]
    * Default: AL_INVERSE_DISTANCE_CLAMPED
    *
    * The model by which sources attenuate with distance.
    *
    * None     - No distance attenuation.
    * Inverse  - Doubling the distance halves the source gain.
    * Linear   - Linear gain scaling between the reference and max distances.
    * Exponent - Exponential gain dropoff.
    *
    * Clamped variations work like the non-clamped counterparts, except the
    * distance calculated is clamped between the reference and max distances.
    */
    [CCode (cname="AL_DISTANCE_MODEL")]
    public const int DISTANCE_MODEL;

    /** Distance model value. */
    [CCode (cname="AL_INVERSE_DISTANCE")]
    public const int INVERSE_DISTANCE;
    [CCode (cname="AL_INVERSE_DISTANCE_CLAMPED")]
    public const int INVERSE_DISTANCE_CLAMPED;
    [CCode (cname="AL_LINEAR_DISTANCE")]
    public const int LINEAR_DISTANCE;
    [CCode (cname="AL_LINEAR_DISTANCE_CLAMPED")]
    public const int LINEAR_DISTANCE_CLAMPED;
    [CCode (cname="AL_EXPONENT_DISTANCE")]
    public const int EXPONENT_DISTANCE;
    [CCode (cname="AL_EXPONENT_DISTANCE_CLAMPED")]
    public const int EXPONENT_DISTANCE_CLAMPED;


    [CCode (cname="alDopplerFactor")]
    public void doppler_factor(ALfloat value);
    [CCode (cname="alDopplerVelocity")]
    public void doppler_velocity(ALfloat value);
    [CCode (cname="alSpeedOfSound")]
    public void speed_of_sound(ALfloat value);
    [CCode (cname="alDistanceModel")]
    public void distance_model(ALenum distanceModel);

    /** Renderer State management. */
    [CCode (cname="alEnable")]
    public void enable(ALenum capability);
    [CCode (cname="alDisable")]
    public void disable(ALenum capability);
    [CCode (cname="alIsEnabled")]
    public ALboolean is_enabled(ALenum capability);

    /** State retrieval. */
    [CCode (cname="alGetString")]
    public unowned string? get_string(ALenum param);
    [CCode (cname="alGetBooleanv")]
    public void get_booleanv(ALenum param, [CCode (array_length = false)]ALboolean[] values);
    [CCode (cname="alGetIntegerv")]
    public void get_integerv(ALenum param, [CCode (array_length = false)]ALint[] values);
    [CCode (cname="alGetFloatv")]
    public void get_floatv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
    [CCode (cname="alGetDoublev")]
    public void get_doublev(ALenum param, [CCode (array_length = false)]ALdouble[] values);
    [CCode (cname="alGetBoolean")]
    public ALboolean get_boolean(ALenum param);
    [CCode (cname="alGetInteger")]
    public ALint get_integer(ALenum param);
    [CCode (cname="alGetFloat")]
    public ALfloat get_float(ALenum param);
    [CCode (cname="alGetDouble")]
    public ALdouble get_double(ALenum param);

    /**
    * Error retrieval.
    *
    * Obtain the first error generated in the AL context since the last check.
    */
    [CCode (cname="alGetError")]
    public ALenum get_error();

    /**
    * Extension support.
    *
    * Query for the presence of an extension, and obtain any appropriate function
    * pointers and enum values.
    */
    [CCode (cname="alIsExtensionPresent")]
    public ALboolean is_extension_present(string extname);
    [CCode (cname="alGetProcAddress")]
    public void* get_proc_address(string fname);
    [CCode (cname="alGetEnumValue")]
    public ALenum get_enum_value(string ename);

    /** Set Listener parameters */
    [CCode (cname="alListenerf")]
    public void listenerf(ALenum param, ALfloat value);
    [CCode (cname="alListener3f")]
    public void listener3f(ALenum param, ALfloat value1, ALfloat value2, ALfloat value3);
    [CCode (cname="alListenerfv")]
    public void listenerfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
    [CCode (cname="alListeneri")]
    public void listeneri(ALenum param, ALint value);
    [CCode (cname="alListener3i")]
    public void listener3i(ALenum param, ALint value1, ALint value2, ALint value3);
    [CCode (cname="alListeneriv")]
    public void listeneriv(ALenum param, [CCode (array_length = false)]ALint[] values);

    /** Get Listener parameters */
    [CCode (cname="alGetListenerf")]
    public void get_listenerf(ALenum param, out ALfloat value);
    [CCode (cname="alGetListener3f")]
    public void get_listener3f(ALenum param, out ALfloat value1, out ALfloat value2, out ALfloat value3);
    [CCode (cname="alGetListenerfv")]
    public void get_listenerfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
    [CCode (cname="alGetListeneri")]
    public void get_listeneri(ALenum param, out ALint value);
    [CCode (cname="alGetListener3i")]
    public void get_listener3i(ALenum param, out ALint value1, out ALint value2, out ALint value3);
    [CCode (cname="alGetListeneriv")]
    public void get_listeneriv(ALenum param, [CCode (array_length = false)]ALint[] values);


    public struct Source : ALuint { 
        /** Set Source parameters. */
        [CCode (cname="alSourcef")]
        public void set_paramf(ALenum param, ALfloat value);
        [CCode (cname="alSource3f")]
        public void set_param3f(ALenum param, ALfloat value1, ALfloat value2, ALfloat value3);
        [CCode (cname="alSourcefv")]
        public void set_paramfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
        [CCode (cname="alSourcei")]
        public void set_parami(ALenum param, ALint value);
        [CCode (cname="alSource3i")]
        public void set_param3i(ALenum param, ALint value1, ALint value2, ALint value3);
        [CCode (cname="alSourceiv")]
        public void set_paramiv(ALenum param, [CCode (array_length = false)]ALint[] values);

        /** Get Source parameters. */
        [CCode (cname="alGetSourcef")]
        public void get_paramf(ALenum param, out ALfloat value);
        [CCode (cname="alGetSource3f")]
        public void get_param3f(ALenum param, out ALfloat value1, out ALfloat value2, out ALfloat value3);
        [CCode (cname="alGetSourcefv")]
        public void get_paramfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
        [CCode (cname="alGetSourcei")]
        public void get_parami( ALenum param, out ALint value);
        [CCode (cname="alGetSource3i")]
        public void get_param3i(ALenum param, out ALint value1, out ALint value2, out ALint value3);
        [CCode (cname="alGetSourceiv")]
        public void get_paramiv(ALenum param, [CCode (array_length = false)]ALint[]values);

        /** Play, replay, or resume (if paused) a list of Sources */
        [CCode (cname="sourcePlayv")]
        public static void playv(ALsizei n, [CCode (array_length = false)]Source[] sources);
        /** Stop a list of Sources */
        [CCode (cname="sourceStopv")]
        public static void stopv(ALsizei n, [CCode (array_length = false)]Source[] sources);
        /** Rewind a list of Sources */
        [CCode (cname="sourceRewindv")]
        public static void rewindv(ALsizei n, [CCode (array_length = false)]Source[] sources);
        /** Pause a list of Sources */
        [CCode (cname="sourcePausev")]
        public static void pausev(ALsizei n, [CCode (array_length = false)]Source[] sources);

        /** Play, replay, or resume a Source */
        [CCode (cname="sourcePlay")]
        public void play();
        /** Stop a Source */
        [CCode (cname="sourceStop")]
        public void stop();
        /** Rewind a Source (set playback postiton to beginning) */
        [CCode (cname="sourceRewind")]
        public void rewind();
        /** Pause a Source */
        [CCode (cname="sourcePause")]
        public void pause();

        /** Queue buffers onto a source */
        public void queue_buffers(ALsizei nb, [CCode (array_length = false)]ALuint[] buffers);
        /** Unqueue processed buffers from a source */
        public void unqueue_buffers(ALsizei nb, [CCode (array_length = false)]ALuint[] buffers);
    }

    /** Create Source objects. */
    [CCode (cname="alGenSources")]
    public void gen_sources(ALsizei n, [CCode (array_length = false)]Source[] sources);
    /** Delete Source objects. */
    [CCode (cname="alDeleteSources")]
    public void delete_sources(ALsizei n, [CCode (array_length = false)]Source[] sources);
    /** Verify a handle is a valid Source. */
    [CCode (cname="alIsSource")]
    public ALboolean is_source(Source source);

    public struct Buffer : ALuint { 
        /** Specifies the data to be copied into a buffer */
        [CCode (cname="alBufferData")]
        public void set_data(ALenum format, [CCode (array_length = false)]uint8[] data, ALsizei size, ALsizei freq);
    
        /** Set Buffer parameters, */
        [CCode (cname="alBufferf")]
        public void set_paramf(ALenum param, ALfloat value);
        [CCode (cname="alBuffer3f")]
        public void set_param3f(ALenum param, ALfloat value1, ALfloat value2, ALfloat value3);
        [CCode (cname="alBufferfv")]
        public void set_paramfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
        [CCode (cname="alBufferi")]
        public void set_parami(ALenum param, ALint value);
        [CCode (cname="alBuffer3i")]
        public void set_param3i(ALenum param, ALint value1, ALint value2, ALint value3);
        [CCode (cname="alBufferiv")]
        public void set_paramiv(ALenum param, [CCode (array_length = false)]ALint[] values);
    
        /** Get Buffer parameters. */
        [CCode (cname="alGetBufferf")]
        public void get_paramf(ALenum param, out ALfloat value);
        [CCode (cname="alGetBuffer3f")]
        public void get_param3f(ALenum param, out ALfloat value1, out ALfloat value2, out ALfloat value3);
        [CCode (cname="alGetBufferfv")]
        public void get_paramfv(ALenum param, [CCode (array_length = false)]ALfloat[] values);
        [CCode (cname="alGetBufferi")]
        public void get_parami(ALenum param, out ALint value);
        [CCode (cname="alGetBuffer3i")]
        public void get_param3i(ALenum param, out ALint value1, out ALint value2, out ALint value3);
        [CCode (cname="alGetBufferiv")]
        public void get_paramiv(ALenum param, [CCode (array_length = false)]ALint[] values);
    }

    /** Create Buffer objects */
    [CCode (cname="alGenBuffers")]
    public void gen_buffers(ALsizei n, [CCode (array_length = false)]Buffer[] buffers);
    /** Delete Buffer objects */
    [CCode (cname="alDeleteBuffers")]
    public void delete_buffers(ALsizei n, [CCode (array_length = false)]Buffer[] buffers);
    /** Verify a handle is a valid Buffer */
    [CCode (cname="alIsBuffer")]
    public ALboolean is_buffer(Buffer buffer);
}

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="AL/alc.h")]
namespace ALC
{
}
