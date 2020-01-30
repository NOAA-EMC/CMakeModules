# This module looks for environment variables detailing where W3NCO lib is
# If variables are not set, W3NCO will be built from external source
if(DEFINED ENV{W3NCO_LIBd} )
  set(W3NCO_LIBd $ENV{W3NCO_LIBd} CACHE STRING "W3NCO_d Library Location" )
  set(W3NCO_LIB4 $ENV{W3NCO_LIB4} CACHE STRING "W3NCO_4 Library Location" )
  set(W3NCO_LIB8 $ENV{W3NCO_LIB8} CACHE STRING "W3NCO_4 Library Location" )

  set(name "w3nco")
  string(TOUPPER ${name} uppercase_name)

  string(REGEX MATCH "(v[0-9]+\\.[0-9]+\\.[0-9]+)" _ ${${uppercase_name}_LIB4})
  set(version ${CMAKE_MATCH_1})

  set(kinds "4" "d" "8")
  foreach(kind ${kinds})
    set(lib_name ${name}_${kind})
    set(versioned_lib_name ${name}_${version}_${kind})

    get_filename_component(lib_dir ${${uppercase_name}_LIB${kind}} DIRECTORY)
    find_library(lib_path NAMES ${versioned_lib_name} PATHS ${lib_dir} NO_DEFAULT_PATH)
    
    add_library(${lib_name} STATIC IMPORTED)
    set_target_properties(${lib_name} PROPERTIES
      IMPORTED_LOCATION ${lib_path})
  endforeach()
endif()
