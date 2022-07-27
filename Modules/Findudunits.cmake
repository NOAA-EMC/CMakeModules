# (C) Copyright 2022- UCAR.
#
# Try to find the udunits headers and library
#
# This module defines:
#
#   - udunits::udunits    - The udunits shared library and include directory, all in a single target.
#   - udunits_SHARED_LIB  - The library
#   - udunits_INCLUDE_DIR - The include directory
#
# The following paths will be searched in order if set in CMake (first priority) or environment (second priority):
#
#   - UDUNITS2_INCLUDE_DIRS & UDUNITS2_LIBRARIES - folders containing udunits2.h and libudunits2, respectively.
#   - UDUNITS2_ROOT                 - root of udunits installation
#   - UDUNITS2_PATH                 - root of udunits installation
#
# Notes:
#   - The hint variables are capitalized because this is how they are exposed in the jedi stack.
#     See https://github.com/JCSDA-internal/jedi-stack/blob/develop/modulefiles/compiler/compilerName/compilerVersion/udunits/udunits.lua for details.

find_path (
	udunits_INCLUDE_DIR
	udunits2.h
	HINTS ${UDUNITS2_INCLUDE_DIRS} $ENV{UDUNITS2_INCLUDE_DIRS}
		${UDUNITS2_ROOT} $ENV{UDUNITS2_ROOT}
		${UDUNITS2_PATH} $ENV{UDUNITS2_PATH}
	DOC "Path to udunits2.h"
	)
find_library(udunits_SHARED_LIB
	NAMES udunits2 udunits
	HINTS ${UDUNITS2_LIBRARIES} $ENV{UDUNITS2_LIBRARIES}
		${UDUNITS2_ROOT} $ENV{UDUNITS2_ROOT}
		${UDUNITS2_PATH} $ENV{UDUNITS2_PATH}
	DOC "Path to libudunits"
	)

include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (udunits DEFAULT_MSG udunits_SHARED_LIB udunits_INCLUDE_DIR)

mark_as_advanced (udunits_SHARED_LIB udunits_INCLUDE_DIR)

if(udunits_FOUND AND NOT TARGET udunits::udunits)
	add_library(udunits::udunits INTERFACE IMPORTED)
	set_target_properties(udunits::udunits PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${udunits_INCLUDE_DIR})
	set_target_properties(udunits::udunits PROPERTIES INTERFACE_LINK_LIBRARIES ${udunits_SHARED_LIB})
endif()

