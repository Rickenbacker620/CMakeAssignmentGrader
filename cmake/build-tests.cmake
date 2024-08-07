foreach(STUDENT_ID ${STUDENT_IDS})
    list(TRANSFORM STUDENT_SOURCES PREPEND ${ASSIGNMENTS_ROOT_DIR}/${STUDENT_ID}/ OUTPUT_VARIABLE STUDENT_SOURCES_PATH)
    # Compile students' code into static library
    add_library(${STUDENT_ID} ${STUDENT_SOURCES_PATH})
    target_include_directories(${STUDENT_ID} PUBLIC ${ASSIGNMENTS_ROOT_DIR}/${STUDENT_ID})

    # Link tests to students' code
    list(TRANSFORM TEST_SOURCES PREPEND ${TESTS_ROOT_DIR}/ OUTPUT_VARIABLE TEST_SOURCE_PATH)
    add_executable(${STUDENT_ID}_tests ${TEST_SOURCE_PATH})
    target_link_libraries(${STUDENT_ID}_tests ${STUDENT_ID} GTest::gtest_main)

    gtest_discover_tests(${STUDENT_ID}_tests
        TEST_PREFIX ${STUDENT_ID}.)
endforeach()