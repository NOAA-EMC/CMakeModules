# This module looks for environment variables detailing where SIGIO lib is
# If variables are not set, SIGIO will be built from external source 
if(DEFINED ENV{SIGIO_LIB} )
  message("HEY!! setting SIGIO library via environment variable")
  set(SIGIO_LIB $ENV{SIGIO_LIB} CACHE STRING "SIGIO Library Location" )
  set(SIGIO_INC $ENV{SIGIO_INC} CACHE STRING "SIGIO Include Location" )
  set(SIGIO_INC4 $ENV{SIGIO_INC4} CACHE STRING "SIGIO Include Location" )

  set( SIGIO_LIB_PATH ${SIGIO_LIB} CACHE STRING "SIGIO Library Location" )
  set( SIGIO_INCLUDE_PATH ${SIGIO_LIB} CACHE STRING "SIGIO include Location" )
else()
  set(SIGIO_VER 2.1.0)
  find_library( SIGIO_LIB 
    NAMES libsigio_v${SIGIO_VER}.a 
    HINTS 
      ${CMAKE_INSTALL_PREFIX}/lib
    )
  set(SIGIO_INC ${CMAKE_INSTALL_PREFIX}/include CACHE STRING "SIGIO Include Location" )
  set(SIGIO_INC4 ${CMAKE_INSTALL_PREFIX}/include CACHE STRING "SIGIO Include Location" )
endif()



