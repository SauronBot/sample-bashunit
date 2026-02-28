#!/usr/bin/env bash
# Tests for src/calculator.sh
# Demonstrates: assert_equals, assert_same
source "$(dirname "$0")/../src/calculator.sh"

test_add_two_positive_numbers() {
  assert_equals "5" "$(add 2 3)"
}

test_add_with_negative_number() {
  assert_equals "-1" "$(add -3 2)"
}

test_subtract() {
  assert_equals "7" "$(subtract 10 3)"
}

test_multiply() {
  assert_equals "12" "$(multiply 3 4)"
}

test_divide_exact() {
  assert_equals "5" "$(divide 10 2)"
}

test_divide_by_zero_returns_error_message() {
  assert_same "error: division by zero" "$(divide 10 0)"
}
