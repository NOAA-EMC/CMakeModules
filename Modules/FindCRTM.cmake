# This module attempts to find the CRTM library and will set it up to build if it cannot be found
#  
if(DEFINED ENV{CRTM} )
  set(CRTM_LIB $ENV{CRTM_LIB} CACHE STRING "CRTM Library Location" )
  set(CRTM_VER $ENV{CRTM_VER} CACHE STRING "CRTM Version")
  set(CRTM_INC $ENV{CRTM_INC} CACHE STRING "CRTM_8 Library Location")
  set( CRTM_LIB_PATH ${CRTM_LIB} CACHE STRING "CRTM Library Location" )
endif()
