cmake_minimum_required(VERSION 3.2)

project(mylib)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
file (GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "${CMAKE_MODULE_PATH}/version_hpp.in"
  "${CMAKE_CURRENT_SOURCE_DIR}/version.hpp"
  )

INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} DESTINATION include
        COMPONENT headers FILES_MATCHING PATTERN "*.hpp")
INSTALL(TARGETS mylib DESTINATION lib COMPONENT libraries)
