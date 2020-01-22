# This module looks for environment variables detailing where SFCIO lib is
# If variables are not set, SFCIO will be built from external source
if(DEFINED ENV{SFCIO_LIB4} )
  set(SFCIO_LIB4 $ENV{SFCIO_LIB4} CACHE STRING "SFCIO_4 Library Location" )
  set(SFCIO_INC4 $ENV{SFCIO_INC4} CACHE STRING "SFCIO_4 Include Location" )
else()
  set(SFCIO_VER 1.1.0)
  find_library( SFCIO_LIB4
    NAMES libsfcio_v${SFCIO_VER}_4.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
      ${NCEPLIBS_INSTALL_DIR}/lib
    )
  if(${NCEPLIBS_INSTALL_DIR})
    set(SFCIO_INC4 ${NCEPLIBS_INSTALL_DIR}/include_4 CACHE STRING "SFCIO_4 Include Location" )
  else()
    set(SFCIO_INC4 ${CMAKE_INSTALL_PREFIX}/include_4 CACHE STRING "SFCIO_4 Include Location" )
  endif()
endif()
