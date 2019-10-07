# This module looks for environment variables detailing where IP lib is
# If variables are not set, IP will be built from external source 

if(DEFINED ENV{IP_LIBd} )
  message("HEY!! setting IP library via environment variable")
  set(IP_LIBd $ENV{IP_LIBd} CACHE STRING "IP Library Location" )
  set(IP_LIB4 $ENV{IP_LIB4} CACHE STRING "IP_4 Library Location" )
  set(IP_LIB8 $ENV{IP_LIB4} CACHE STRING "IP_8 Library Location" )
  set(IP_INC4 $ENV{IP_INC4} CACHE STRING "IP_4 Include Location" )
  set(IP_INC8 $ENV{IP_INC8} CACHE STRING "IP_8 Include Location" )
  set(IP_INCd $ENV{IP_INCd} CACHE STRING "IP_8 Include Location" )

  set( IP_LIBd_PATH ${IP_LIBd} CACHE STRING "IP Library Location" )
  set( IP_LIB4_PATH ${IP_LIB4} CACHE STRING "IP_4 Library Location" )

endif()
