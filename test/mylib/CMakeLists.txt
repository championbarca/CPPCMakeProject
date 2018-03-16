cmake_minimum_required(VERSION 3.2)

project(UNIT_TEST)

find_package(Threads REQUIRED)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}
    ${GTEST_INCLUDE_DIR}
    ${CMAKE_SOURCE_DIR}/mylib
)

link_directories(${GTEST_LIB_DIR})

add_executable(mylibunittest mylib_test.cpp)

target_link_libraries(mylibunittest ${GTEST_LIBRARIES} mylib)

add_test(mylib_complete_test mylibunittest)
