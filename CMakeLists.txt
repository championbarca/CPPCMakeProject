cmake_minimum_required(VERSION 3.2)

project (CPPCMakeProject LANGUAGES CXX)

set (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

# CPPCMakeProject version
#
set(CPPCMakeProject_VERSION_MAJOR 1)
set(CPPCMakeProject_VERSION_MINOR 0)
set(CPPCMakeProject_VERSION_PATCH 0)
set(CPPCMakeProject_VERSION ${CPPCMakeProject_VERSION_MAJOR}.${CPPCMakeProject_VERSION_MINOR}.${CPPCMakeProject_VERSION_PATCH})

# OPTIONS
#
option(CPPCMakeProject_USE_GTEST "Use GTest (fixme turn off if you want to install)" ON)
option(CPPCMakeProject_USE_BENCHMARK "Use Benchmark (fixme turn off if you want to install)" ON)
option(CPPCMakeProject_USE_OpenMP "Use OpenMP" OFF)
option(CPPCMakeProject_USE_BOOST "Use BOOST" OFF)

MESSAGE (STATUS "Version is ${CPPCMakeProject_VERSION}")

# Guard against in-source builds and bad build-type strings
#
include(ConfigSafeGuards)
include(ConfigGitRevision)

if (NOT CMAKE_BUILD_TYPE)
    set (CMAKE_BUILD_TYPE RELEASE 
         CACHE STRING "Choose the type of build : None Debug Release RelWithDebInfo MinSizeRel Coverage."
         FORCE)
endif(NOT CMAKE_BUILD_TYPE)

# Example how to set c++ compiler flags for GNU
#
if((CMAKE_CXX_COMPILER_ID MATCHES GNU) OR (CMAKE_CXX_COMPILER_ID MATCHES Clang))
    set(CMAKE_CXX_FLAGS         "${CMAKE_CXX_FLAGS} -std=c++17 -pthread -Wconversion -Wall -Wextra -Wno-unknown-pragmas -Wno-sign-compare -Woverloaded-virtual -Wwrite-strings -Wno-unused")
    set(CMAKE_CXX_FLAGS_DEBUG   "-O0 -g3")
    set(CMAKE_CXX_FLAGS_RELEASE "-O4 -DNDEBUG")
    set(CMAKE_CXX_FLAGS_COVERAGE "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")
endif()


set (CMAKE_INSTALL_PREFIX ./${CPPCMakeProject_VERSION}/${CMAKE_BUILD_TYPE})

find_package(Boost REQUIRED)
find_package(cppcheck REQUIRED)
find_package(clang-format REQUIRED)
find_package(clang-tidy REQUIRED)
find_package(Doxygen REQUIRED)
find_package(SpdLog REQUIRED)
include(ConfigCppCheck)
include(ConfigClangFormat)
include(ConfigClangTidy)

#include_directories(${CMAKE_SOURCE_DIR}/include)
#         ${BOOST_INCLUDE_DIRS}
#         ${GTEST_INCLUDE_DIRS}
#         ${GBENCMARK_INCLUDE_DIRS}
#)

#link_directories(
#    ${BOOST_LIBRARY_DIRS}
#    ${GTEST_LIBRARY_DIRS}
#    ${GBENCMARK_LIBRARY_DIRS}
#)


# Our CPPCMakeProject testing framework (gtest)
#
if(${CPPCMakeProject_USE_GTEST})
    include(CTest)
    find_package(GTest REQUIRED)
    enable_testing()
    add_subdirectory(${CMAKE_SOURCE_DIR}/test/)
endif()

# Our CPPCMakeProject benchmark framework (gbenchmark)
#
if (${CPPCMakeProject_USE_BENCHMARK})
    find_package(GBenchmark REQUIRED)
    add_subdirectory(benchmark)
endif()

add_subdirectory(tools)
add_subdirectory(mylib)
add_subdirectory(mymain)
add_subdirectory(doc/doxygen)

include(InstallRequiredSystemLibraries)
SET(CPACK_PACKAGE_DESCRIPTION "${CMAKE_PROJECT_NAME}")
SET(CPACK_PACKAGE_VERSION_MAJOR "${CPPCMakeProject_VERSION_MAJOR}")
SET(CPACK_PACKAGE_VERSION_MINOR "${CPPCMakeProject_VERSION_MINOR}")
SET(CPACK_PACKAGE_VERSION_PATCH "${CPPCMakeProject_VERSION_PATCH}")
SET(CPACK_PACKAGE_VENDOR "Vinit")
SET(CPACK_PACKAGE_CONTACT "vinit@yahoo.com")
SET(CPACK_GENERATOR "TGZ")
SET(CPACK_SOURCE_GENERATOR "TGZ")
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "${CMAKE_INSTALL_PREFIX}")
SET(CPACK_SOURCE_IGNORE_FILES "build")
SET(CPACK_STRIP_FILES "bin/main")
SET(CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}-${CPPCMakeProject_VERSION}")
SET(CPACK_INSTALL_CMAKE_PROJECTS "mylib;mylib;ALL;/;mymain;main;ALL;/")
SET(CPACK_SET_DESTDIR ON)
include (CPack)

