#!/usr/bin/env bash
# Tests for src/files.sh
# Demonstrates: assert_equals, assert_true, assert_false,
#               assert_greater_than, set_up, tear_down
source "$(dirname "$0")/../src/files.sh"

TEMP_FILE=""

set_up() {
  TEMP_FILE="$(mktemp)"
  printf "line one\nline two\nline three\n" > "$TEMP_FILE"
}

tear_down() {
  rm -f "$TEMP_FILE"
}

# assert_equals: line count
test_count_lines_returns_correct_count() {
  assert_equals "3" "$(count_lines "$TEMP_FILE")"
}

# assert_greater_than: at least one line
test_file_has_more_than_zero_lines() {
  assert_greater_than "0" "$(count_lines "$TEMP_FILE")"
}

# assert_equals on error path
test_count_lines_on_missing_file_returns_error() {
  assert_equals "error: file not found" "$(count_lines "/nonexistent/path.txt")"
}

# assert_true / assert_false: extension check
test_has_extension_returns_true_for_matching_ext() {
  has_extension "script.sh" "sh"
  assert_exit_code "0"
}

test_has_extension_returns_false_for_wrong_ext() {
  has_extension "script.sh" "txt"
  assert_exit_code "1"
}
