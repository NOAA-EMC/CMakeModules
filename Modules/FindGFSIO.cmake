# This module looks for environment variables detailing where GFSIO lib is
# If variables are not set, GFSIO will be built from external source
if(DEFINED ENV{GFSIO_LIB4} )
  set(GFSIO_LIB4 $ENV{GFSIO_LIB4} CACHE STRING "GFSIO Library Location" )
  set(GFSIO_INC4 $ENV{GFSIO_INC4} CACHE STRING "GFSIO_4 Include Location" )
else()
  set(GFSIO_VER 1.1.0)
  find_library( GFSIO_LIB4
    NAMES libgfsio_v${GFSIO_VER}_4.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
      ${NCEPLIBS_INSTALL_DIR}/lib
    )
  set(GFSIO_INC4 ${CMAKE_INSTALL_PREFIX}/include_4 CACHE STRING "GFSIO Include Location" )
endif()
