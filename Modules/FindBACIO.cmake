# This module looks for environment variables detailing where BACIO lib is
# If variables are not set, BACIO will be built from external source 
if(DEFINED ENV{BACIO} )
  set(BACIO_LIB4 $ENV{BACIO_LIB4} CACHE STRING "BACIO Library Location" )
  set(BACIO_VER $ENV{BACIO_VER} CACHE STRING "BACIO Version")
  set(BACIO_LIB8 $ENV{BACIO_LIBd} CACHE STRING "BACIO_8 Library Location")
  set(BACIO_LIBd $ENV{BACIO_LIBd} CACHE STRING "BACIO_8 Library Location")
  set( BACIO_LIB4_PATH ${BACIO_LIB4} CACHE STRING "BACIO Library Location" )
endif()
