# This module looks for environment variables detailing where NEMSIOGFS lib is
# If variables are not set, NEMSIOGFS will be built from external source 
if(DEFINED ENV{NEMSIOGFS_LIB} )
  message("HEY!! setting NEMSIOGFS library via environment variable")
  set(NEMSIOGFS_LIB $ENV{NEMSIOGFS_LIB} CACHE STRING "IP Library Location" )
  set(NEMSIOGFS_INC $ENV{NEMSIOGFS_INC} CACHE STRING "NEMSIOGFS_4 Include Location" )
  set( NEMSIOGFS_LIB_PATH ${NEMSIOGFS_LIB} CACHE STRING "NEMSIOGFS Library Location" )
  set( NEMSIOGFS_INCLUDE_PATH ${NEMSIOGFS_INC} CACHE STRING "NEMSIOGFS Include Location" )

endif()
