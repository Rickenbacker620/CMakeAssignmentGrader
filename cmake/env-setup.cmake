message(STATUS "Setting up Testing Environment")
include(FetchContent)
include(CTest)
include(GoogleTest)


FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_SHALLOW 1
  GIT_TAG v1.15.0
)
FetchContent_MakeAvailable(googletest)

enable_testing()

if(NOT DEFINED REPO_URL_TEMPLATE)
    message(FATAL_ERROR "Please set the REPO_URL_TEMPLATE environment variable")
endif()

if (NOT DEFINED STUDENT_IDS)
    message(FATAL_ERROR "Please set the STUDENT_ID environment variable")
endif()

if(NOT DEFINED STUDENT_SOURCES)
    message(FATAL_ERROR "Please set the STUDENT_SOURCE_FILES environment variable")
endif()