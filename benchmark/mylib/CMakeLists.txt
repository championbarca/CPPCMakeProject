cmake_minimum_required(VERSION 3.2)

project(BENCHMARK_TEST)

find_package(Threads REQUIRED)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}
    ${Benchmark_INCLUDE_DIR}
    ${CMAKE_SOURCE_DIR}/mylib
)

link_directories(${Benchmark_LIB_DIR})

add_executable(mylibenchmark mylib_bench.cpp)

target_link_libraries(mylibenchmark ${Benchmark_LIBRARIES} mylib)