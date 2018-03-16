# additional target to perform clang-format run, requires clang-format

# get all project files
file(GLOB_RECURSE SOURCE_FILES "*.cpp" "*.h" "*.hpp")
set (EXCLUDE_DIR "/build/")
foreach (TMP_PATH ${SOURCE_FILES})
    string (FIND ${TMP_PATH} ${EXCLUDE_DIR} EXCLUDE_DIR_FOUND)
    if (${EXCLUDE_DIR_FOUND} EQUAL -1)
        list (APPEND ALL_SOURCE_FILES ${TMP_PATH})
    endif ()
endforeach(TMP_PATH)

add_custom_target(
        clangformat
        COMMAND ${CLANGFORMAT_EXECUTABLE}
        -style=LLVM
        -i
        ${ALL_SOURCE_FILES}
)
