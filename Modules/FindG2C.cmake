# This module looks for environment variables detailing where G2 lib is
# If variables are not set, G2 will be built from external source 
if(DEFINED ENV{G2C} )
  set(G2C_LIBRARY $ENV{G2C_LIB} CACHE STRING "G2C Library Location" )
  set(G2C_VER $ENV{G2C_VER} CACHE STRING "G2C Version")
  set( G2C_LIBRARY_PATH ${G2C_LIBRARY} CACHE STRING "G2C Library Location" )
endif()
