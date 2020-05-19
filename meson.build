project('bodhi', 'vala', 'c', version: '0.1')

PROJECT_NAME = meson.project_name ()
PROJECT_VERSION = meson.project_version ()
VERSIONED_PROJECT_NAME = PROJECT_NAME+'-'+PROJECT_VERSION
CAMEL_CASE_NAME = 'Bodhi'
VERSIONED_CAMEL_CASE_NAME = CAMEL_CASE_NAME +'-'+ PROJECT_VERSION

GIR_NAME = VERSIONED_CAMEL_CASE_NAME+'.gir'
TYPELIB_NAME = VERSIONED_CAMEL_CASE_NAME+'.typelib'
VAPI_NAME = VERSIONED_PROJECT_NAME+'.vapi'

VAPI_DIR = meson.current_source_dir() / 'vapi'
BUILD_DIR = meson.current_build_dir()

# need math?
cc = meson.get_compiler('c')
m_dep = cc.find_library('m', required : false)

bodhi_dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gee-0.8'),
#   dependency('gio-2.0'),
    dependency('glesv2'),
#   dependency('gl'),
#   dependency('glfw3'),
#   dependency('glew'),
    dependency('sdl2'),
    dependency('physfs'),
    dependency('openal'),
    dependency('sndfile'),

    m_dep
]



#subdir('src')

bodhi_sources = files(

    'src/constants.vala',

    'src/color.vala',

    'src/math/vector2.vala',
    'src/math/vector3.vala',
    'src/math/vector4.vala',
    'src/math/matrix4x4.vala',
    'src/math/math_util.vala',

    'src/system/subsystem/subsystem.vala',

    'src/system/subsystem/file_system/file_system.vala',
    'src/system/subsystem/file_system/file.vala',

    'src/system/subsystem/audio_system/audio_system.vala',
    'src/system/subsystem/audio_system/audio_file.vala',
    'src/system/subsystem/audio_system/audio_source.vala',
    'src/system/subsystem/audio_system/audio_listener.vala',

    'src/system/subsystem/rendering/window_system.vala',
    'src/system/subsystem/rendering/render_system.vala',
    'src/system/subsystem/rendering/scene_manager.vala',

    'src/system/subsystem/log_system.vala',
    'src/system/subsystem/input_system.vala',

    'src/system/engine.vala',
)

add_project_arguments(['--vapidir', VAPI_DIR], language: 'vala')

# Compile lib with GIR file
libbodhi = shared_library(
	VERSIONED_PROJECT_NAME, 
	bodhi_sources,
	vala_header: PROJECT_NAME+'.h',
	vala_vapi: VAPI_NAME,
	vala_gir: GIR_NAME,
	dependencies: bodhi_dependencies,
	install: true,
	install_dir: [true, true, true, true]
)

# Compile typelib from GIR file
g_ir_compiler = find_program('g-ir-compiler')
custom_target(
	'Bodhi-typelib', command: [
		g_ir_compiler,
		'--shared-library', 'lib'+PROJECT_NAME+'-@0@.so'.format (PROJECT_VERSION),
		  '--output', '@OUTPUT@',
		join_paths(BUILD_DIR, GIR_NAME)
	],
	
	output: TYPELIB_NAME,
	depends: libbodhi,
	install: true,
	install_dir: get_option('libdir') / 'girepository-1.0'
)


#examples in Vala

libbodhi_dep = declare_dependency(link_with: libbodhi)

executable('01_init_and_input',
  sources: 'examples/Vala/01_init_and_input.vala',
  dependencies: [bodhi_dependencies, libbodhi_dep])

executable('02_file_operations',
  sources: 'examples/Vala/02_file_operations.vala',
  dependencies: [bodhi_dependencies, libbodhi_dep])

executable('03_sound_and_music',
  sources: 'examples/Vala/03_sound_and_music.vala',
  dependencies: [bodhi_dependencies, libbodhi_dep])
