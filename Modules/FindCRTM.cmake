# This module attempts to find the CRTM library and will set it up to build if it cannot be found
#  
if(DEFINED ENV{CRTM_LIB})
  set(CRTM_VER $ENV{CRTM_VER} CACHE STRING "CRTM Version")
  set(CRTM_LIB $ENV{CRTM_LIB} CACHE STRING "CRTM Library Location")
  set(CRTM_INC $ENV{CRTM_INC} CACHE STRING "CRTM Library Location")
else()
  set(CRTM_VER 2.3.0)
  find_library( CRTM_LIB 
    NAMES libcrtm_v${CRTM_VER}.a 
    HINTS 
      ${NCEPLIBS_INSTALL_DIR}/lib
      ${NCEPLIBS_INSTALL_DIR}/lib
    )
  if(${NCEPLIBS_INSTALL_DIR})
    set(CRTM_INC ${NCEPLIBS_INSTALL_DIR}/include CACHE STRING "CRTM Include Location")
  else()
    set(CRTM_INC ${CMAKE_INSTALL_PREFIX}/include CACHE STRING "CRTM Include Location")
  endif()
endif()
