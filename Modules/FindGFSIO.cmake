# This module looks for environment variables detailing where GFSIO lib is
# If variables are not set, GFSIO will be built from external source 
if(DEFINED ENV{GFSIO_LIB4} )
  message("HEY!! setting GFSIO library via environment variable")
  set(GFSIO_LIB4 $ENV{GFSIO_LIB4} CACHE STRING "GFSIO Library Location" )
  set(GFSIO_INC $ENV{GFSIO_INC} CACHE STRING "GFSIO_4 Include Location" )
  set( GFSIO_LIB_PATH ${GFSIO_LIB4} CACHE STRING "GFSIO Library Location" )
  set( GFSIO_INCLUDE_PATH ${GFSIO_INC4} CACHE STRING "GFSIO Include Location" )
else()
  set(GFSIO_VER 1.1.0)
  find_library( GFSIO_LIB 
    NAMES libgfsio_v${GFSIO_VER}.a 
    HINTS 
      ${CMAKE_INSTALL_PREFIX}/lib
    )
  set(GFSIO_INC ${CMAKE_INSTALL_PREFIX}/include CACHE STRING "GFSIO Include Location" )
  set(GFSIO_INC4 ${CMAKE_INSTALL_PREFIX}/include CACHE STRING "GFSIO Include Location" )
endif()


