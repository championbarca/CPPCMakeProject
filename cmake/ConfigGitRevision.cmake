#==================================================
# Automatically generated, but not overwritten
#
# Adapted from: https://github.com/bast/cmake-example/tree/master/cmake
#==================================================
#
find_package(Git)
if(GIT_FOUND)
    execute_process(
        COMMAND ${GIT_EXECUTABLE} rev-list --max-count=1 HEAD
        OUTPUT_VARIABLE MyFirstProject_GIT_REVISION
        ERROR_QUIET
        )
    if(NOT ${MyFirstProject_GIT_REVISION} STREQUAL "")
        string(STRIP ${MyFirstProject_GIT_REVISION} MyFirstProject_GIT_REVISION)
    endif()
    message(STATUS "Current git revision is ${MyFirstProject_GIT_REVISION}")
else()
    set(MyFirstProject_GIT_REVISION "unknown")
endif()