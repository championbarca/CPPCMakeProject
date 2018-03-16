#==================================================
# Automatically generated, but not overwritten
#
# Adapted from: https://github.com/bast/cmake-example/tree/master/cmake
#==================================================
#
find_program(
    CLANGFORMAT_EXECUTABLE
    NAMES clang-format
    DOC "cppcheck command line client"
    )
mark_as_advanced(CLANGFORMAT_EXECUTABLE)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(clang-format DEFAULT_MSG CLANGFORMAT_EXECUTABLE)