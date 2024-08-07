message(STATUS "Pulling student code")
foreach(STUDENT_ID ${STUDENT_IDS})
    string(REPLACE ${STUDENT_ID_PLACEHOLDER} ${STUDENT_ID} STUDENT_REPO ${REPO_URL_TEMPLATE})
    message(STATUS "Pulling ${STUDENT_ID}'s code from ${STUDENT_REPO}")
    FetchContent_Declare(${STUDENT_ID}
        GIT_REPOSITORY ${STUDENT_REPO}
        SOURCE_DIR ${ASSIGNMENTS_ROOT_DIR}/${STUDENT_ID}
        GIT_SHALLOW 1
        GIT_TAG ${REPO_BRANCH}
    )
    FetchContent_MakeAvailable(${STUDENT_ID})
endforeach()