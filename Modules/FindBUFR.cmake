# This module looks for environment variables detailing where BUFR lib is
# If variables are not set, BUFR will be built from external source
if(DEFINED ENV{BUFR_LIB4} )
  set(BUFR_VER $ENV{BUFR_VER} CACHE STRING "BUFR Version")
  set(BUFR_LIB4 $ENV{BUFR_LIB4} CACHE STRING "BUFR_4 Library Location")
  set(BUFR_LIB8 $ENV{BUFR_LIB8} CACHE STRING "BUFR_8 Library Location")
  set(BUFR_LIBd $ENV{BUFR_LIBd} CACHE STRING "BUFR_d Library Location")
else()
  set(BUFR_VER 11.3.0)
  find_library( BUFR_LIBd
    NAMES libbufr_v${BUFR_VER}_d.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
    )
  find_library( BUFR_LIB4
    NAMES libbufr_v${BUFR_VER}_4.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
    )
  find_library( BUFR_LIB8
    NAMES libbufr_v${BUFR_VER}_8.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
    )
endif()
