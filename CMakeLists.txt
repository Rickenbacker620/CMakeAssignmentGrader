cmake_minimum_required(VERSION 3.17)
project("CMake Assignment Grader")


# Set the format of the repo URL here, <STUDENT_ID> placeholder will be replaced with STUDENT_ID
set(REPO_URL_TEMPLATE
    https://github.com/Example-ORG/examplehw-<STUDENT_ID>.git
)

# Set the branch of the repo to pull from, default is main
set(REPO_BRANCH
    main
)

# Set student IDs here which will be used to replace the <STUDENT_ID> placeholder in the REPO_URL_TEMPLATE
set(STUDENT_IDS
    Student1
    Student2
)

# Set student source files here
set(STUDENT_SOURCES
    example.c
)

# Set test source files here
set(TEST_SOURCES
    example_tests.cpp
)


include(env-setup)
include(pull-repos)
include(build-tests)
include(gen-comments)