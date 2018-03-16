
# Try to find the Google SPDLOG library and headers.
#  SPDLOG_FOUND        - system has SPDLOG lib
#  SPDLOG_INCLUDE_DIRS - the SPDLOG include directory
#  SPDLOG_LIBRARIES    - libraries needed to use SPDLOG
if (SPDLOG_FOUND)
    return()
endif(SPDLOG_FOUND)

if (NOT SPDLOG_ROOT)
    set(SPDLOG_ROOT "/home/vinit/install/spdlog-master/Release")
endif(NOT SPDLOG_ROOT)

find_path(SPDLOG_INCLUDE_DIR
  NAMES spdlog/spdlog.h
  HINTS "${SPDLOG_ROOT}/include"
)

set(SPDLOG_INCLUDE_DIRS ${SPDLOG_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(SPDLOG
  FOUND_VAR SPDLOG_FOUND
  REQUIRED_VARS SPDLOG_INCLUDE_DIR
)

mark_as_advanced(SPDLOG_FOUND)

