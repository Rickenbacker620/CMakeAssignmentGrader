cmake_minimum_required(VERSION 3.17)

if(NOT DEFINED ENV{GITHUB_ACCESS_TOKEN})
    message(FATAL_ERROR "GITHUB_ACCESS_TOKEN is not defined")
endif()

set(GITHUB_ACCESS_TOKEN $ENV{GITHUB_ACCESS_TOKEN})

set(GITHUB_ORG_URL
    github.com/SochaCS5008SU2024
)

set(ASSIGNMENT_PREFIX hw09-)

set(REPO_SUFFIXS
   JerryYanTY
   Lxsong77
)

# Set students' code file names
set(STUDENT_SOURCE_FILES
    my_bst.c
    my_bst.h
)

include(${CMAKE_CURRENT_SOURCE_DIR}/grader.cmake)

include(${CMAKE_CURRENT_SOURCE_DIR}/assignment-download.cmake)