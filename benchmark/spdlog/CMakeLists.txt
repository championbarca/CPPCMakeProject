cmake_minimum_required(VERSION 3.2)

project(BENCHMARK_TEST)

find_package(Threads REQUIRED)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}
    ${Benchmark_INCLUDE_DIR}
    ${SPDLOG_INCLUDE_DIR}
)

link_directories(${Benchmark_LIB_DIR})

add_executable(spdlogBenchamrk spdlog_benchmark.cpp)

target_link_libraries(spdlogBenchamrk ${Benchmark_LIBRARIES})