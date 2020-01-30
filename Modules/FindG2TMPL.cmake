# This module looks for environment variables detailing where G2TMPL lib is
# If variables are not set, G2TMPL will be built from external source
if(DEFINED ENV{G2TMPL_LIBd} )
  set(G2TMPL_LIBd $ENV{G2TMPL_LIBd} CACHE STRING "G2TMPL_d Library Location" )
  set(G2TMPL_INCd $ENV{G2TMPL_INCd} CACHE STRING "G2TMPL_d Include Location" )

  set(name "g2tmpl")
  string(TOUPPER ${name} uppercase_name)

  string(REGEX MATCH "(v[0-9]+\\.[0-9]+\\.[0-9]+)" _ ${${uppercase_name}_LIBd})
  set(version ${CMAKE_MATCH_1})

  set(kinds "d")
  foreach(kind ${kinds})
    set(lib_name ${name}_${kind})
    set(versioned_lib_name ${name}_${version}_${kind})

    if(EXISTS ${${uppercase_name}_LIB${kind}} )
      get_filename_component(lib_dir ${${uppercase_name}_LIB${kind}} DIRECTORY)
      find_library(lib_path NAMES ${versioned_lib_name} PATHS ${lib_dir} NO_DEFAULT_PATH)
    
      add_library(${lib_name} STATIC IMPORTED)
      set_target_properties(${lib_name} PROPERTIES
        IMPORTED_LOCATION ${lib_path}
        INTERFACE_INCLUDE_DIRECTORIES ${${uppercase_name}_INC${kind}})    
    endif()
  endforeach()
endif()
