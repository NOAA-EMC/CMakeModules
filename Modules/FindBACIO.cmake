# This module looks for environment variables detailing where BACIO lib is
# If variables are not set, BACIO will be built from external source
if(DEFINED ENV{BACIO_LIB4})
  set(BACIO_VER $ENV{BACIO_VER} CACHE STRING "BACIO Version")
  set(BACIO_LIB4 $ENV{BACIO_LIB4} CACHE STRING "BACIO_4 Library Location")
  set(BACIO_LIB8 $ENV{BACIO_LIB8} CACHE STRING "BACIO_8 Library Location")
  set(BACIO_LIBd $ENV{BACIO_LIBd} CACHE STRING "BACIO_d Library Location")
else()
  set(BACIO_VER 2.1.0)
  find_library( BACIO_LIBd
    NAMES libbacio_v${BACIO_VER}_d.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
    )
  find_library( BACIO_LIB4
    NAMES libbacio_v${BACIO_VER}_4.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
    )
  find_library( BACIO_LIB8
    NAMES libbacio_v${BACIO_VER}_8.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
    )
endif()
