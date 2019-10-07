# This module looks for environment variables detailing where NEMSIO lib is
# If variables are not set, NEMSIO will be built from external source 
if(DEFINED ENV{NEMSIO_LIB} )
  message("HEY!! setting NEMSIO library via environment variable")
  set(NEMSIO_LIB $ENV{NEMSIO_LIB} CACHE STRING "IP Library Location" )
  set(NEMSIO_INC $ENV{NEMSIO_INC} CACHE STRING "NEMSIO_4 Include Location" )
  set( NEMSIO_LIB_PATH ${NEMSIO_LIB} CACHE STRING "NEMSIO Library Location" )
  set( NEMSIO_INCLUDE_PATH ${NEMSIO_INC} CACHE STRING "NEMSIO Include Location" )
else()
  set(NEMSIO_VER 2.2.3)
  find_library( NEMSIO_LIB 
    NAMES libnemsio_v${NEMSIO_VER}.a 
    HINTS 
      ${CMAKE_INSTALL_PREFIX}/lib
    )
  set(NEMSIO_INC ${CMAKE_INSTALL_PREFIX}/include CACHE STRING "NEMSIO Include Location" )
endif()



