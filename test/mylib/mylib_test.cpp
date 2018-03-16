#include "sum.hpp"
#include <gtest/gtest.h>
#include <iostream>

TEST(MYLIB_MethodSum_TEST, PositiveInteger) { EXPECT_EQ(30, Sum(10, 20)); }

TEST(MYLIB_MethodSum_TEST, NegativeInteger) { EXPECT_EQ(-30, Sum(-10, -20)); }
