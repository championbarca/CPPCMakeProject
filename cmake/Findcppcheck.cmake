#==================================================
# Automatically generated, but not overwritten
#
# Adapted from: https://github.com/bast/cmake-example/tree/master/cmake
#==================================================
#
find_program(
    CPPCHECK_EXECUTABLE
    NAMES cppcheck
    DOC "cppcheck command line client"
    )
mark_as_advanced(CPPCHECK_EXECUTABLE)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(cppcheck DEFAULT_MSG CPPCHECK_EXECUTABLE)