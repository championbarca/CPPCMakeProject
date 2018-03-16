#==================================================
# Automatically generated, but not overwritten
#
# Adapted from: https://github.com/bast/cmake-example/tree/master/cmake
#==================================================
#
find_program(
    CLANGTIDY_EXECUTABLE
    NAMES clang-tidy
    DOC "cppcheck command line client"
    )
mark_as_advanced(CLANGTIDY_EXECUTABLE)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(clang-tidy DEFAULT_MSG CLANGTIDY_EXECUTABLE)
set(DO_CLANG_TIDY "${CLANGTIDY_EXECUTABLE}" "-checks=*,-clang-analyzer-alpha.*")