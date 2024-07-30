file(GLOB SUB_DIRS RELATIVE ${ASSIGNMENTS_ROOT_DIR} ${ASSIGNMENTS_ROOT_DIR}/*)

file(GLOB GRADING_SOURCE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

foreach(TARGET_ASSIGNMENT ${SUB_DIRS})

    set(STUDENT_SOURCES ${STUDENT_SOURCE_FILES})

    list(TRANSFORM STUDENT_SOURCES PREPEND ${ASSIGNMENTS_ROOT_DIR}/${TARGET_ASSIGNMENT}/)

    # Compile students' code into static library
    add_library(${TARGET_ASSIGNMENT} ${STUDENT_SOURCES})
    target_include_directories(${TARGET_ASSIGNMENT} PUBLIC ${ASSIGNMENTS_ROOT_DIR}/${TARGET_ASSIGNMENT})


    # Link grader to students's code
    add_executable(${TARGET_ASSIGNMENT}_grader ${GRADING_SOURCE_FILES})
    target_link_libraries(${TARGET_ASSIGNMENT}_grader ${TARGET_ASSIGNMENT}
    GTest::gtest_main)

    gtest_discover_tests(${TARGET_ASSIGNMENT}_grader
    TEST_PREFIX ${TARGET_ASSIGNMENT}_)

endforeach()