cmake_minimum_required(VERSION 3.2)

project(main)

set (TARGET main)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_SOURCE_DIR}/mylib
)

# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "${CMAKE_MODULE_PATH}/version_hpp.in"
  "${CMAKE_CURRENT_SOURCE_DIR}/version.hpp"
  )

file (GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

link_directories(${INSTALL_LIB_PATH}
        ${BOOST_LIBRARY_DIRS}
)

add_executable(main ${SOURCES})

target_link_libraries(${TARGET}
        mylib
        boost_thread
        boost_system
)

INSTALL(PROGRAMS ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS} DESTINATION lib COMPONENT libraries)
INSTALL(TARGETS main DESTINATION bin COMPONENT applications)
#INSTALL(FILES ${BOOST_LIBRARY_DIRS}/boost_system DESTINATION lib)