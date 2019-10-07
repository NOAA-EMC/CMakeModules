# This module looks for environment variables detailing where BUFR lib is
# If variables are not set, BUFR will be built from external source 
if(DEFINED ENV{BUFR_LIB4} )
  set(BUFR_LIB4 $ENV{BUFR_LIB4} CACHE STRING "BUFR Library Location" )
  set(BUFR_VER $ENV{BUFR_VER} CACHE STRING "BUFR Version")
  set(BUFR_LIB8 $ENV{BUFR_LIB8} CACHE STRING "BUFR_8 Library Location")
  set(BUFR_LIBd $ENV{BUFR_LIBd} CACHE STRING "BUFR_8 Library Location")
  set( BUFR_LIB4_PATH ${BUFR_LIB4} CACHE STRING "BUFR Library Location" )
endif()

set( BUFR_LIB4_PATH ${BUFR_LIB4} CACHE STRING "BUFR Library Location" )

