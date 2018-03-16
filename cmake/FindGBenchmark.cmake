
# Try to find the Google Benchmark library and headers.
#  Benchmark_FOUND        - system has benchmark lib
#  Benchmark_INCLUDE_DIRS - the benchmark include directory
#  Benchmark_LIBRARIES    - libraries needed to use benchmark
if (Benchmark_FOUND)
    return()
endif(Benchmark_FOUND)

if (NOT GBENCHMARK_ROOT)
    set(GBENCHMARK_ROOT "/home/vinit/install/benchmark/Release")
endif(NOT GBENCHMARK_ROOT)

find_path(Benchmark_INCLUDE_DIR
  NAMES benchmark/benchmark.h
  HINTS "${GBENCHMARK_ROOT}/include"
)

find_path(Benchmark_LIB_DIR
  NAMES benchmark
  HINTS "${GBENCHMARK_ROOT}/lib"
)

find_library(Benchmark_LIBRARY
  NAMES benchmark
  HINTS "${GBENCHMARK_ROOT}/lib"
)

set(Benchmark_INCLUDE_DIRS ${Benchmark_INCLUDE_DIR})
set(Benchmark_LIBRARIES    ${Benchmark_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Benchmark
  FOUND_VAR Benchmark_FOUND
  REQUIRED_VARS Benchmark_INCLUDE_DIR Benchmark_LIBRARY
)

mark_as_advanced(Benchmark_FOUND)

