cmake_minimum_required(VERSION 3.17)
project("CMake Assignment Grader")

set(CMAKE_C_STANDARD 11)
set(ASSIGNMENTS_ROOT_DIR ${CMAKE_SOURCE_DIR}/assignments)
set(BUILD_GMOCK OFF)
set(INSTALL_GTEST OFF)

include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG v1.15.0
)
FetchContent_MakeAvailable(googletest)

include(CTest)
include(GoogleTest)
enable_testing()

add_subdirectory(grader)
