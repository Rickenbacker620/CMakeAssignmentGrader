set(ASSIGNMENTS_ROOT_DIR ${CMAKE_SOURCE_DIR}/assignments)

file(MAKE_DIRECTORY ${ASSIGNMENTS_ROOT_DIR})

add_custom_target(download_assignments
    DEPENDS ${REPO_SUFFIXS}
)

foreach(SUFFIX ${REPO_SUFFIXS})
    set(GIT_REPO_NAME ${ASSIGNMENT_PREFIX}${SUFFIX})
    add_custom_command(OUTPUT ${SUFFIX}
        WORKING_DIRECTORY ${ASSIGNMENTS_ROOT_DIR}
        COMMAND ${CMAKE_COMMAND} -E remove_directory ${GIT_REPO_NAME}
        COMMAND git clone --depth 1 https://${GITHUB_ACCESS_TOKEN}@${GITHUB_ORG_URL}/${GIT_REPO_NAME}.git
    )
endforeach()