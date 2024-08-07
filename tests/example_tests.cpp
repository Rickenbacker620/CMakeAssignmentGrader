#include <gtest/gtest.h>

extern "C" {
//  Include student's header file and C library's header file
}


// Write your test cases here
TEST(SanityCheck, TestEQ) {
    ASSERT_EQ(1, 1);
}

TEST(SanityCheck, TestEQ) {
    ASSERT_NE(1, 2);
}