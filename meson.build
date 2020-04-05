project('shared lib', 'vala', 'c')

PROJECT_VERSION='0.1'

gnome = import('gnome')

# need math?
cc = meson.get_compiler('c') 
m_dep = cc.find_library('m', required : false) 

bodhi_dependecies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gio-2.0'),    
    dependency('gl'),
    dependency('glew'),
    dependency('sdl2'),
    dependency('SDL2_gfx'),
    dependency('SDL2_ttf'),
    dependency('SDL2_image'),
    dependency('SDL2_mixer'),

    m_dep
]

vapi_dir = meson.current_source_dir() / 'vapi'
build_dir = meson.current_source_dir() / 'build'
add_project_arguments(['--vapidir', vapi_dir], language: 'vala')
add_project_arguments(['--gir', 'Bodhi-' + PROJECT_VERSION + '.gir'], language: 'vala')


#subdir('src')

bodhi_sources = files(
    'src/constants.vala',

    'src/color.vala',

    'src/math/vector2.vala',
    'src/math/vector3.vala',
    'src/math/vector4.vala',
    'src/math/matrix4x4.vala',

    'src/system/log_system.vala',
    'src/system/window_system.vala',
    'src/system/render_system.vala',
    'src/system/scene_manager.vala',
    'src/system/engine.vala',
    
    #'test.vala',
)

bodhi_inc = include_directories('.', './build/')

libbodhi = library(
    'Bodhi', 
    sources: bodhi_sources, 
    dependencies: bodhi_dependecies
)

#bodhi_gir = gnome.generate_gir(
#    libbodhi,
#    include_directories: bodhi_inc,
#    header: meson.current_source_dir() / 'build/bodhi.h',
#    sources: bodhi_sources, 
#    dependencies: bodhi_dependecies,
#    namespace: 'Bodhi',
#    nsversion: PROJECT_VERSION,
#    install: true,
#)

#executable('app_name', sources: bodhi_sources, dependencies: bodhi_dependecies)
