if (GTEST_FOUND)
    return()
endif()

if (NOT GTEST_ROOT)
    set (GTEST_ROOT "/home/vinit/install/googletest/Release")
endif()

set(GTEST_H gtest/gtest.h)


find_path(GTEST_INCLUDE_DIR ${GTEST_H}
  PATHS ${GTEST_ROOT}/include
        $ENV{IMPALA_HOME}/thirdparty/gtest-$ENV{IMPALA_GTEST_VERSION}/include
        NO_DEFAULT_PATH
  DOC   "Path to the ${GTEST_H} file"
)

find_path(GTEST_LIB_DIR libgtest.a
  PATHS ${GTEST_ROOT}/lib
        $ENV{IMPALA_HOME}/thirdparty/gtest-$ENV{IMPALA_GTEST_VERSION}/lib
        NO_DEFAULT_PATH
  DOC   "Path to the libgtest.a file"
)

find_library(GTEST_STATIC_LIB NAMES libgtest.a
  PATHS ${GTEST_ROOT}/lib
        $ENV{IMPALA_HOME}/thirdparty/gtest-$ENV{IMPALA_GTEST_VERSION}
        NO_DEFAULT_PATH
  DOC   "Google's framework for writing C++ tests (gtest)"
)

find_library(GTEST_MAIN_LIBRARY NAMES libgtest_main.a
  PATHS ${GTEST_ROOT}/lib
        $ENV{IMPALA_HOME}/thirdparty/gtest-$ENV{IMPALA_GTEST_VERSION}
        NO_DEFAULT_PATH
  DOC   "Google's framework for writing C++ tests (gtest_main)"
)

if(GTEST_INCLUDE_DIR AND GTEST_STATIC_LIB AND GTEST_MAIN_LIBRARY)
  set(GTEST_LIBRARIES ${GTEST_STATIC_LIB} ${GTEST_MAIN_LIBRARY})
  set(GTEST_FOUND TRUE)
else(GTEST_INCLUDE_DIR AND GTEST_STATIC_LIB AND GTEST_MAIN_LIBRARY)
  set(GTEST_FOUND FALSE)
endif(GTEST_INCLUDE_DIR AND GTEST_STATIC_LIB AND GTEST_MAIN_LIBRARY)

if(GTEST_FOUND)
  if(NOT GTEST_FIND_QUIETLY)
    message(STATUS "Found GTest: ${GTEST_LIBRARIES}")
  endif(NOT GTEST_FIND_QUIETLY)
else(GTEST_FOUND)
  message(FATAL_ERROR "Could not find the GTest Library")
endif(GTEST_FOUND)

mark_as_advanced(
  GTEST_INCLUDE_DIR
  GTEST_LIBRARIES
GTEST_STATIC_LIB)