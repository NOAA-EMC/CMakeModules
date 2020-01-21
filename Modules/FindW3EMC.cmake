# This module looks for environment variables detailing where W3EMC lib is
# If variables are not set, W3EMC will be built from external source

if(DEFINED ENV{W3EMC_LIBd} )
  set(W3EMC_VER $ENV{W3EMC_VER} CACHE STRING "W3EMC Version")
  set(W3EMC_LIB4 $ENV{W3EMC_LIB4} CACHE STRING "W3EMC_4 Library Location")
  set(W3EMC_LIB8 $ENV{W3EMC_LIB8} CACHE STRING "W3EMC_8 Library Location")
  set(W3EMC_LIBd $ENV{W3EMC_LIBd} CACHE STRING "W3EMC_d Library Location")
  set(W3EMC_INC4 $ENV{W3EMC_INC4} CACHE STRING "W3EMC_4 Include Location")
  set(W3EMC_INC8 $ENV{W3EMC_INC8} CACHE STRING "W3EMC_8 Include Location")
  set(W3EMC_INCd $ENV{W3EMC_INCd} CACHE STRING "W3EMC_d Include Location")
else()
  set(W3EMC_VER 2.2.0)
  find_library( W3EMC_LIB4
    NAMES libw3emc_v${W3EMC_VER}_4.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
      ${NCEPLIBS_INSTALL_DIR}/lib
    )
  find_library( W3EMC_LIB8
    NAMES libw3emc_v${W3EMC_VER}_8.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
      ${NCEPLIBS_INSTALL_DIR}/lib
    )
  find_library( W3EMC_LIBd
    NAMES libw3emc_v${W3EMC_VER}_d.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
      ${NCEPLIBS_INSTALL_DIR}/lib
    )
  set(W3EMC_INC4 ${CMAKE_INSTALL_PREFIX}/include_4 CACHE STRING "W3EMC_4 Include Location" )
  set(W3EMC_INC8 ${CMAKE_INSTALL_PREFIX}/include_8 CACHE STRING "W3EMC_8 Include Location" )
  set(W3EMC_INCd ${CMAKE_INSTALL_PREFIX}/include_d CACHE STRING "W3EMC_d Include Location" )
endif()
