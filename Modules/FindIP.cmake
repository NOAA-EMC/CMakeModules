# This module looks for environment variables detailing where IP lib is
# If variables are not set, IP will be built from external source

if(DEFINED ENV{IP_LIBd} )
  set(IP_LIBd $ENV{IP_LIBd} CACHE STRING "IP_d Library Location" )
  set(IP_LIB4 $ENV{IP_LIB4} CACHE STRING "IP_4 Library Location" )
  set(IP_LIB8 $ENV{IP_LIB8} CACHE STRING "IP_8 Library Location" )
  set(IP_INC4 $ENV{IP_INC4} CACHE STRING "IP_4 Include Location" )
  set(IP_INC8 $ENV{IP_INC8} CACHE STRING "IP_8 Include Location" )
  set(IP_INCd $ENV{IP_INCd} CACHE STRING "IP_d Include Location" )
else()
  set(IP_VER 3.0.0)
  find_library( IP_LIBd
    NAMES libip_v${IP_VER}_d.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
    )
  find_library( IP_LIB4
    NAMES libip_v${IP_VER}_4.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
    )
  find_library( IP_LIB8
    NAMES libip_v${IP_VER}_8.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
    )
  set(IP_INC4 ${CMAKE_INSTALL_PREFIX}/include_4 CACHE STRING "IP_4 Include Location" )
  set(IP_INC8 ${CMAKE_INSTALL_PREFIX}/include_8 CACHE STRING "IP_8 Include Location" )
  set(IP_INCd ${CMAKE_INSTALL_PREFIX}/include_d CACHE STRING "IP_d Include Location" )
endif()
