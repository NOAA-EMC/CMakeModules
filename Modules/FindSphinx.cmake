
# CMake find_package() Module for Sphinx documentation generator
# http://sphinx-doc.org/
#
# Example usage:
#
# find_package(Sphinx)
#
# If successful the following variables will be defined
# SPHINX_FOUND
# SPHINX_EXECUTABLE
#
# Source: https://opensource.apple.com/source/clang/clang-700.0.72/src/cmake/modules/FindSphinx.cmake.auto.html
#
find_program(SPHINX_EXECUTABLE
             NAMES sphinx-build sphinx-build2
             DOC "Path to sphinx-build executable")
mark_as_advanced(SPHINX_EXECUTABLE)

# Handle REQUIRED and QUIET arguments
# this will also set SPHINX_FOUND to true if SPHINX_EXECUTABLE exists
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Sphinx
                                  "Failed to locate sphinx-build executable"
                                  SPHINX_EXECUTABLE)

# Provide options for controlling different types of output
option(SPHINX_OUTPUT_HTML "Output standalone HTML files" ON)
option(SPHINX_OUTPUT_LATEX "Output LaTeX PDF files" OFF)
option(SPHINX_OUTPUT_MAN "Output man pages" OFF)

option(SPHINX_WARNINGS_AS_ERRORS "When building documentation treat warnings as errors" ON)
