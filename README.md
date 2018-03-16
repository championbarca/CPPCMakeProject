# CPPCMakeProject

This Project is created for C++ people looking for cpp project with all the modern developer setup incorporated as solution for starting new development
I have incorporated various tools within this project using CMake
1) clang-format 
    For beautification of source code. Command for changeing source code format as per standard is "make clangformat"
2) cppcheck
    Tool for static code analysis
3) clan-tidy
    Tool for static code analysis. This tools follow most of the guidelines mentioned at https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md
4) gtest
    TDD tool for writing test cases
5) gbenchamrk
    For testing performance of particular operation in C++
6) valgrind memcheck
    For detecting memory leak within source code
7) package creation
    Once project is at delivery stage, there is make package and make package_source creates corresponding packages of the project
8) doxygen documentation