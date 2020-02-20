# This module looks for environment variables detailing where SP lib is
# If variables are not set, SP will be built from external source

if(DEFINED ENV{SP_LIBd})
  set(SP_LIBd $ENV{SP_LIBd} CACHE STRING "SP_d Library Location" )
  set(SP_LIB4 $ENV{SP_LIB4} CACHE STRING "SP_4 Library Location" )
  set(SP_LIB8 $ENV{SP_LIB8} CACHE STRING "SP_8 Library Location" )

  set(name "sp")
  string(TOUPPER ${name} uppercase_name)

  string(REGEX MATCH "(v[0-9]+\\.[0-9]+\\.[0-9]+)" _ ${${uppercase_name}_LIBd})
  set(version ${CMAKE_MATCH_1})

  set(kinds "4" "d" "8")
  foreach(kind ${kinds})
    set(lib_name ${name}_${kind})
    set(versioned_lib_name ${name}_${version}_${kind})

    if(EXISTS ${${uppercase_name}_LIB${kind}} )
      get_filename_component(lib_dir ${${uppercase_name}_LIB${kind}} DIRECTORY)
      find_library(sp_path_${kind} NAMES ${versioned_lib_name} PATHS ${lib_dir} NO_DEFAULT_PATH)
      message("sp: ${sp_path_${kind}}")
      message("versioned_lib_name: ${versioned_lib_name}")
      add_library(${lib_name} STATIC IMPORTED)
      set_target_properties(${lib_name} PROPERTIES
        IMPORTED_LOCATION ${sp_path_${kind}})
    endif()
  endforeach()
endif()
