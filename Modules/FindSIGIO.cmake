# This module looks for environment variables detailing where SIGIO lib is
# If variables are not set, SIGIO will be built from external source 
if(DEFINED ENV{SIGIO_LIB} )
  message("HEY!! setting SIGIO library via environment variable")
  set(SIGIO_LIB $ENV{SIGIO_LIB} CACHE STRING "SIGIO Library Location" )
  set(SIGIO_INC $ENV{SIGIO_INC} CACHE STRING "SIGIO Include Location" )
  set(SIGIO_INC4 $ENV{SIGIO_INC4} CACHE STRING "SIGIO Include Location" )

  set( SIGIO_LIB_PATH ${SIGIO_LIB} CACHE STRING "SIGIO Library Location" )
  set( SIGIO_INCLUDE_PATH ${SIGIO_LIB} CACHE STRING "SIGIO include Location" )

endif()
