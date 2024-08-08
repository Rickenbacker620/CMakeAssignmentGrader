# CMake Grader based on Google Test

## How to use

### **Step1:** Setup varibles

Open `CMakeLists.txt` and set the following variables:

```cmake
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
```
By setting `REPO_URL_TEMPLATE` to `https://github.com/Example-ORG/examplehw-<STUDENT_ID>.git` and `STUDENT_IDS` to `Tom` and `Jerry`, it will pull code from `https://github.com/Example-ORG/examplehw-Tom.git` and `https://github.com/Example-ORG/examplehw-Jerry.git`


```cmake
# Set test source files here
set(TEST_SOURCES
    example_tests.cpp
)

# Set student source files here
set(STUDENT_SOURCES
    example.c
)
```
- `TEST_SOURCES` Test files that will be compiled and run against the student's code, it will be places in the `tests` directory. You can also leave this empty if you don't want to run tests, in that case, the student's code will be compiled into binaries and output will be in the `bin` folder

- `STUDENT_SOURCES`  Student's source files that will be compiled and run against the test files, students' sources will be pulled and placed in a directory named after the STUDENT_ID, under the `assignments` directory

An example assignment structure would look like this:

```
assignments/
├── Jerry
│   └── example.c
└── Tom
    └── example.c
```

### **Step2:** Write Tests

Write test files in the `tests` directory, you can use the `example_tests.cpp` file as a template

```cpp
#include <gtest/gtest.h>

extern "C" {
//  Include student's header file and C library's header file
}


// Write your test cases here
TEST(SanityCheck, TestEqual) {
    ASSERT_EQ(1, 1);
}

TEST(SanityCheck, TestNotEqual) {
    ASSERT_NE(1, 2);
}
```

All student's header files should be included in the `extern "C"` block, and the test cases should be written in the `TEST` block

For example, if the assignment structure is like this:

```
assignments/
├── Jerry
│   ├── example.c
│   └── example.h
└── Tom
    ├── example.c
    └── example.h
```

Then only write include like this in the test files:

```cpp
extern "C" {
    #include "example.h"
}
```

No relative path is needed, the grader will automatically locate the header files in the `assignments` directory


### **Step3:** Run CMake Configure

First run this to pull the code and generate the build scripts:
```bash
cmake --preset default
```

Run cmake --build to build the project:
```bash
cmake --build build
```

The output will be in the `bin` directory

### **Step4:** Run the tests

if you wrote test files in `tests` directory, you can run the all the tests by running the following command:
```bash
cd build && ctest
```

or run the test binary directly, they are located in the `bin` folder like this:
```
bin/
├── Jerry_test
└── Tom_test
```

If you didn't write any test files, you can run the student's code directly in the `bin` directory:
```
bin/
├── Jerry
└── Tom
```


### **Step5:** Generate comments pdf

The grader can generate a pdf based on markdown files in each student's directory.

> This requires `pandoc` to be installed on your system


You can write a `comments.md` file in each student's directory, and run the following command to generate a pdf file with the comments:

```
assignments/
├── Jerry
│   ├── comments.md
│   └── example.c
└── Tom
    ├── comments.md
    └── example.c
```

Run this command

```bash
cmake --build build --target gen-comments
```

Then the pdf files will be generated in the `comments` directory

```
comments/
├── Jerry_comments.pdf
└── Tom_comments.pdf
```





