# This module looks for environment variables detailing where G2 lib is
# If variables are not set, G2 will be built from external source 
if(DEFINED ENV{G2_LIBd} )
  message("HEY!! setting G2 library via environment variable")
  set(G2_LIBd $ENV{G2_LIBd} CACHE STRING "G2 Library Location" )
  set(G2_LIB4 $ENV{G2_LIB4} CACHE STRING "G2_4 Library Location" )
  set(G2_INC4 $ENV{G2_INC4} CACHE STRING "G2_4 Include Location" )
  set(G2_INCd $ENV{G2_INCd} CACHE STRING "G2_d Include Location" )
  set(G2_LIBd_PATH ${G2_LIBd} CACHE STRING "G2 Library Location" )
  set(G2_LIB4_PATH ${G2_LIB4} CACHE STRING "G2_4 Library Location" )
  set( G2_LIBd_PATH ${G2_LIBd} CACHE STRING "G2 Library Location" )
  set( G2_LIB4_PATH ${G2_LIB4} CACHE STRING "G2_4 Library Location" )
  
endif()
