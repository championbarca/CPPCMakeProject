# additional target to perform cppcheck run, requires cppcheck

# get all project files
# HACK this workaround is required to avoid qml files checking ^_^
file(GLOB_RECURSE SOURCE_FILES "*.h" "*.hpp" "*.cpp")
set (EXCLUDE_DIR "/build/")
foreach (TMP_PATH ${SOURCE_FILES})
    string (FIND ${TMP_PATH} ${EXCLUDE_DIR} EXCLUDE_DIR_FOUND)
    if (${EXCLUDE_DIR_FOUND} EQUAL -1)
        list (APPEND ALL_SOURCE_FILES ${TMP_PATH})
    endif ()
endforeach(TMP_PATH)
message("${ALL_SOURCE_FILES}")
add_custom_target(
        cppcheck
        COMMAND ${CPPCHECK_EXECUTABLE}
        #--enable=warning,performance,portability,information,missingInclude
        --enable=all
        --std=c++11
        --suppress=missingIncludeSystem
        --template="[{severity}][{id}] {message} {callstack} \(On {file}:{line}\)"
        --verbose
        --quiet
        ${ALL_SOURCE_FILES}
)
