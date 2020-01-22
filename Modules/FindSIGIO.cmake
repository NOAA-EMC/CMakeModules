# This module looks for environment variables detailing where SIGIO lib is
# If variables are not set, SIGIO will be built from external source
if(DEFINED ENV{SIGIO_LIB4} )
  set(SIGIO_LIB4 $ENV{SIGIO_LIB4} CACHE STRING "SIGIO_4 Library Location" )
  set(SIGIO_INC4 $ENV{SIGIO_INC4} CACHE STRING "SIGIO_4 Include Location" )
else()
  set(SIGIO_VER 2.1.0)
  find_library( SIGIO_LIB4
    NAMES libsigio_v${SIGIO_VER}_4.a
    HINTS
      ${NECPLIBS_INSTALL_DIR}/lib
    )
  set(SIGIO_INC4 ${NECPLIBS_INSTALL_DIR}/include_4 CACHE STRING "SIGIO Include Location" )
endif()
