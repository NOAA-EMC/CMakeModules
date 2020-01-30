# This module looks for environment variables detailing where SFCIO lib is
# If variables are not set, SFCIO will be built from external source
if(DEFINED ENV{SFCIO_LIB4} )
  set(SFCIO_LIB4 $ENV{SFCIO_LIB4} CACHE STRING "SFCIO_4 Library Location" )
  set(SFCIO_INC4 $ENV{SFCIO_INC4} CACHE STRING "SFCIO_4 Include Location" )
  
  set(name "sfcio")
  string(TOUPPER ${name} uppercase_name)

  string(REGEX MATCH "(v[0-9]+\\.[0-9]+\\.[0-9]+)" _ ${${uppercase_name}_LIB4})
  set(version ${CMAKE_MATCH_1})

  set(versioned_lib_name ${name}_${version})

  if(EXISTS ${${uppercase_name}_LIB${kind}} )
    get_filename_component(lib_dir ${${uppercase_name}_LIB4$} DIRECTORY)
    find_library(lib_path NAMES ${versioned_lib_name} PATHS ${lib_dir} NO_DEFAULT_PATH)
  
    add_library(${name} STATIC IMPORTED)
    set_target_properties(${name} PROPERTIES
      IMPORTED_LOCATION ${lib_path}
      INTERFACE_INCLUDE_DIRECTORIES ${${uppercase_name}_INC4})
  endif()
endif()
