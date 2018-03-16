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

foreach (TMP_PATH ${ALL_SOURCE_FILES})
    string (FIND ${TMP_PATH} ".hpp" EXCLUDE_DIR_FOUND)
    if (${EXCLUDE_DIR_FOUND} GREATER 0)
        list (APPEND ALL_HEADER_FILES ${TMP_PATH})
    endif ()
endforeach(TMP_PATH)

add_custom_target(
        clangtidy
        COMMAND ${CLANGTIDY_EXECUTABLE}
        -checks=*,-clang-analyzer-alpha.*
        -header-filter=*.hpp
        ${ALL_SOURCE_FILES}
        ${ALL_HEADER_FILES}
)
