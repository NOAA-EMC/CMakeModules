# This module attempts to find the CRTM library and will set it up to build if it cannot be found
#  
include(ExternalProject)
if((NOT BUILD_CRTM ) AND (DEFINED ENV{CRTM_LIB4}))
    set(CRTM_LIBRARY $ENV{CRTM_LIB4} )
    if( CORE_LIBRARIES )
      list( APPEND CORE_LIBRARIES ${CRTM_LIBRARY} )
    else()
      set( CORE_LIBRARIES ${CRTM_LIBRARY} )
    endif()
else()
  set(CMAKE_INSTALL_PREFIX ${PROJECT_BINARY_DIR})
  ExternalProject_Add(NCEPLIBS-crtm 
    PREFIX ${PROJECT_BINARY_DIR}/NCEPLIBS-crtm
    CMAKE_ARGS
      -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
      -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
      -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
      -DCMAKE_BUILD_TYPE=RELEASE
      -DCMAKE_Fortran_COMPILER=${CMAKE_Fortran_COMPILER}
    SOURCE_DIR ${PROJECT_SOURCE_DIR}/NCEPLIBS-crtm 
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    BUILD_COMMAND make
    INSTALL_COMMAND make install
  )
  execute_process(COMMAND grep "set(VERSION" CMakeLists.txt WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/NCEPLIBS-crtm OUTPUT_VARIABLE LIBVERSION)
  string(REPLACE "set(VERSION " "" LIBVERSION ${LIBVERSION})
  string(REPLACE ")" "" LIBVERSION ${LIBVERSION})
  string(REPLACE "\n" "" LIBVERSION ${LIBVERSION})
  message("crtm version is ${LIBVERSION}")
  set( CRTM_LIBRARY ${PROJECT_BINARY_DIR}/lib/libcrtm_${LIBVERSION}.a )
  if( CORE_BUILT )
      list( APPEND CORE_BUILT ${CRTM_LIBRARY} )
      list( APPEND EXT_BUILT NCEPLIBS-crtm )
  else()
      set( CORE_BUILT ${CRTM_LIBRARY} )
      set( EXT_BUILT NCEPLIBS-crtm )
  endif()
endif( )

set( CRTM_LIBRARY_PATH ${CRTM_LIBRARY} CACHE STRING "CRTM Library Location" )

