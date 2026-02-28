#!/usr/bin/env bash
# Tests for src/strings.sh
# Demonstrates: assert_equals, assert_contains, assert_string_starts_with,
#               assert_string_ends_with, assert_matches, assert_true, assert_false
source "$(dirname "$0")/../src/strings.sh"

# assert_equals: exact output match (ignoring ANSI/special chars)
test_greet_with_name() {
  assert_equals "Hello, Chema!" "$(greet Chema)"
}

test_greet_without_name_defaults_to_world() {
  assert_equals "Hello, World!" "$(greet)"
}

# assert_contains: substring check
test_greet_contains_hello() {
  assert_contains "Hello" "$(greet Sauron)"
}

# assert_string_starts_with / assert_string_ends_with
test_greet_starts_with_hello() {
  assert_string_starts_with "Hello" "$(greet Bash)"
}

test_greet_ends_with_exclamation() {
  assert_string_ends_with "!" "$(greet Bash)"
}

# assert_matches: regex pattern
test_greet_matches_pattern() {
  assert_matches "^Hello, .+!$" "$(greet Anyone)"
}

# assert_true / assert_false: boolean / exit code
test_valid_email_returns_true() {
  is_valid_email "user@example.com"
  assert_exit_code "0"
}

test_invalid_email_returns_false() {
  is_valid_email "not-an-email"
  assert_exit_code "1"
}

# assert_equals on word count
test_count_words() {
  assert_equals "3" "$(count_words "foo bar baz")"
}

test_reverse_string() {
  assert_equals "olleh" "$(reverse_string "hello")"
}
