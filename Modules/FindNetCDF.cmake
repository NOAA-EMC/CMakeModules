# - Find NetCDF
# Find the native NetCDF and NetCDF-Fortran includes and library
#
#  NETCDF_INCLUDES    - where to find netcdf.h, etc
#  NETCDF_LIBRARIES   - Link these libraries when using NetCDF
#  NETCDF_FOUND       - True if NetCDF found including required interfaces (see below)
#
# Normal usage would be:
#  find_package (NetCDF REQUIRED)
#
# Use this for static NetCDF builds before calling find_package:
#  set(NETCDF_USE_STATIC_LIBRARIES TRUE)
#

if (NETCDF_INCLUDES AND NETCDF_LIBRARIES)
  # Already in cache, be silent
  set (NETCDF_FIND_QUIETLY TRUE)
endif (NETCDF_INCLUDES AND NETCDF_LIBRARIES)

if (NOT NETCDF_INCLUDES OR NOT NETCDF_LIBRARIES)
  find_package(PkgConfig)
  if(PKG_CONFIG_FOUND)
    pkg_check_modules(NetCDF REQUIRED netcdf>=4)
    if(NetCDF_FOUND)
      if(NETCDF_USE_STATIC_LIBRARIES)
        set(NETCDF_INCLUDES ${NetCDF_STATIC_INCLUDE_DIRS})
        string(REPLACE ";" " " NETCDF_LIBRARIES "${NetCDF_STATIC_LDFLAGS}")
      else()
        set(NETCDF_INCLUDES ${NetCDF_INCLUDE_DIRS})
        string(REPLACE ";" " " NETCDF_LIBRARIES "${NetCDF_LDFLAGS}")
      endif()
      pkg_check_modules(NetCDFF REQUIRED netcdf-fortran>=4)
      if(NetCDFF_FOUND)
        if(NETCDF_USE_STATIC_LIBRARIES)
          set(NETCDF_INCLUDES "${NetCDFF_STATIC_INCLUDE_DIRS};${NETCDF_INCLUDES}")
          string(REPLACE ";" " " NETCDF_LIBRARIES "${NetCDFF_STATIC_LDFLAGS}")
        else()
          set(NETCDF_INCLUDES "${NetCDFF_INCLUDE_DIRS};${NETCDF_INCLUDES}")
          string(REPLACE ";" " " NETCDFF_LIBRARIES "${NetCDFF_LDFLAGS}")
          set(NETCDF_LIBRARIES "${NETCDFF_LIBRARIES} ${NETCDF_LIBRARIES}")
        endif()
      endif()
    endif()
  endif(PKG_CONFIG_FOUND)
endif (NOT NETCDF_INCLUDES OR NOT NETCDF_LIBRARIES)

# handle the QUIETLY and REQUIRED arguments and set NETCDF_FOUND to TRUE if
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (NETCDF_LIBRARIES NETCDF_INCLUDES)

mark_as_advanced (NETCDF_LIBRARIES NETCDF_INCLUDES)
