# - Find the NDATE utility or build it

set( NO_DEFAULT_PATH )
if(DEFINED ENV{NDATE})
  set(NDATE $ENV{NDATE} )
else()
  find_file( NDATE
    NAMES ndate.x ndate
    HINTS
        /nwprod/util/exec
        $ENV{NWPROD}/util/exec
        ${CMAKE_INSTALL_PREFIX}/bin
        ${NCEPLIBS_INSTALL_DIR}/lib
    ${NO_DEFAULT_PATH})
endif()
