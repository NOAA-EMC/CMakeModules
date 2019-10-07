# This module looks for environment variables detailing where SFCIO lib is
# If variables are not set, SFCIO will be built from external source 
if(DEFINED ENV{SFCIO} )
  message("HEY!! setting SFCIO library via environment variable")
  set(SFCIO_LIB $ENV{SFCIO_LIB} CACHE STRING "SFCIO Library Location" )
  set(SFCIO_INC $ENV{SFCIO_INC} CACHE STRING "SFCIO Include Location" )

  set( SFCIO_LIB_PATH ${SFCIO_LIB} CACHE STRING "SFCIO Library Location" )
  set( SFCIO_INCLUDE_PATH ${SFCIO_LIB} CACHE STRING "SFCIO Include Location" )
endif()

