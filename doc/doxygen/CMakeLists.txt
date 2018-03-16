
#==================================================
# project_A Doxygen "doc" target
# Automatically generated, but never overwritten
#==================================================
#

# Find doxygen
#--------------------------------------------------

find_package(Doxygen)
if (NOT DOXYGEN_FOUND)
    message(FATAL_ERROR "Doxygen is needed to build the documentation")
endif()

# Configure the doxyfile template 
#--------------------------------------------------

configure_file(${PROJECT_SOURCE_DIR}/doc/doxygen/doxyfile.in ${PROJECT_BINARY_DIR}/doc/doxygen/doxyfile @ONLY IMMEDIATE)

# Add a custom target to run Doxygen when ever the project is built
#--------------------------------------------------
#   If you do want the documentation to be generated EVERY time you build the project 
#   replace add_custom_target(doc...) by add_custom_target(doc ALL...)

# CAVEAT: in case of *super-project* build we define a project_A_doc target
#         instead of the usual "doc" one to avoid name collision
# 
if(${PROJECT_SOURCE_DIR} STREQUAL ${CMAKE_SOURCE_DIR})
   message("${SOURCES}")
   add_custom_target(doc 
      	             COMMAND ${DOXYGEN_EXECUTABLE} ${PROJECT_BINARY_DIR}/doc/doxygen/doxyfile
   		     SOURCES ${PROJECT_BINARY_DIR}/doc/doxygen/doxyfile)
endif()