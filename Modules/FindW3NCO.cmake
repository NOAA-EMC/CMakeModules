# This module looks for environment variables detailing where W3NCO lib is
# If variables are not set, W3NCO will be built from external source 
if(DEFINED ENV{W3NCO_LIB4} )
  set(W3NCO_LIBd $ENV{W3NCO_LIBd} CACHE STRING "W3NCO Library Location" )
  set(W3NCO_LIB4 $ENV{W3NCO_LIB4} CACHE STRING "W3NCO_4 Library Location" )
  set(W3NCO_LIB8 $ENV{W3NCO_LIB8} CACHE STRING "W3NCO_4 Library Location" )
  set( W3NCO_LIBd_PATH ${W3NCO_LIBd} CACHE STRING "W3NCO Library Location" )
  set( W3NCO_LIB4_PATH ${W3NCO_LIB4} CACHE STRING "W3NCO_4 Library Location" )
  set( W3NCO_LIB8_PATH ${W3NCO_LIB8} CACHE STRING "W3NCO_4 Library Location" )
endif()


