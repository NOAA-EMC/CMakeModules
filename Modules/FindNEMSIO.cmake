# This module looks for environment variables detailing where NEMSIO lib is
# If variables are not set, NEMSIO will be built from external source
if(DEFINED ENV{NEMSIO_LIB} )
  set(NEMSIO_LIB $ENV{NEMSIO_LIB} CACHE STRING "NEMSIO Library Location" )
  set(NEMSIO_INC $ENV{NEMSIO_INC} CACHE STRING "NEMSIO Include Location" )
else()
  set(NEMSIO_VER 2.2.3)
  find_library( NEMSIO_LIB
    NAMES libnemsio_v${NEMSIO_VER}.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
      ${NCEPLIBS_INSTALL_DIR}/lib
    )
  if(${NCEPLIBS_INSTALL_DIR})
    set(NEMSIO_INC ${NCEPLIBS_INSTALL_DIR}/include CACHE STRING "NEMSIO Include Location" )
  else()
    set(NEMSIO_INC ${CMAKE_INSTALL_PREFIX}/include CACHE STRING "NEMSIO Include Location" )
  endif()
endif()
