# This module looks for environment variables detailing where W3NCO lib is
# If variables are not set, W3NCO will be built from external source
if(DEFINED ENV{W3NCO_LIBd} )
  set(W3NCO_LIBd $ENV{W3NCO_LIBd} CACHE STRING "W3NCO_d Library Location" )
  set(W3NCO_LIB4 $ENV{W3NCO_LIB4} CACHE STRING "W3NCO_4 Library Location" )
  set(W3NCO_LIB8 $ENV{W3NCO_LIB8} CACHE STRING "W3NCO_4 Library Location" )
else()
  set(W3NCO_VER 2.0.6)
  find_library( W3NCO_LIBd
    NAMES libw3nco_v${W3NCO_VER}_d.a libw3nco_v2.0.6_d.a
    HINTS
      ${NCEPLIBS_INSTALL_DIR}/lib
    )
  find_library( W3NCO_LIB4
    NAMES libw3nco_v${W3NCO_VER}_4.a libw3nco_v2.0.6_4.a
    HINTS
      ${NCEPLIBS_INSTALL_DIR}/lib
    )
  find_library( W3NCO_LIB8
    NAMES libw3nco_v${W3NCO_VER}_8.a libw3nco_v2.0.6_8.a
    HINTS
      ${NCEPLIBS_INSTALL_DIR}/lib
    )
endif()
