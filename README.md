# sample-bashunit

A hands-on demo project for learning [bashunit](https://bashunit.typeddevs.com) — the testing framework for Bash by [TypedDevs](https://github.com/TypedDevs/bashunit).

21 tests across 3 test files, covering the most useful assertion types with real examples.

---

## Project structure

```
src/
  calculator.sh       # Arithmetic functions
  strings.sh          # String manipulation and validation
  files.sh            # File utilities
tests/
  calculator_test.sh  # assert_equals, assert_same
  strings_test.sh     # assert_contains, assert_matches, assert_string_starts_with,
                      # assert_string_ends_with, assert_exit_code
  files_test.sh       # assert_greater_than, assert_exit_code, set_up, tear_down
lib/
  bashunit            # Test runner (see Installation)
```

---

## Installation

```bash
curl -s https://raw.githubusercontent.com/TypedDevs/bashunit/main/install.sh | bash
```

This downloads `bashunit` into the `lib/` folder.

---

## Run the tests

```bash
./lib/bashunit tests/
```

Run a single file:

```bash
./lib/bashunit tests/strings_test.sh
```

---

## Assertions demonstrated

### `assert_equals`
Checks equality, ignoring ANSI/special characters. Good for comparing command output.

```bash
test_add_two_numbers() {
  assert_equals "5" "$(add 2 3)"
}
```

### `assert_same`
Strict equality — special characters included.

```bash
test_divide_by_zero_returns_error_message() {
  assert_same "error: division by zero" "$(divide 10 0)"
}
```

### `assert_contains`
Checks if a string contains a substring.

```bash
test_greet_contains_hello() {
  assert_contains "Hello" "$(greet Sauron)"
}
```

### `assert_string_starts_with` / `assert_string_ends_with`
Checks the beginning or end of a string.

```bash
test_greet_starts_with_hello() {
  assert_string_starts_with "Hello" "$(greet Bash)"
}

test_greet_ends_with_exclamation() {
  assert_string_ends_with "!" "$(greet Bash)"
}
```

### `assert_matches`
Checks against a regex pattern.

```bash
test_greet_matches_pattern() {
  assert_matches "^Hello, .+!$" "$(greet Anyone)"
}
```

### `assert_exit_code`
Checks the exit code of the previously run command. Useful for functions that return a status rather than output.

```bash
test_valid_email_returns_true() {
  is_valid_email "user@example.com"
  assert_exit_code "0"
}

test_invalid_email_returns_false() {
  is_valid_email "not-an-email"
  assert_exit_code "1"
}
```

### `assert_greater_than`
Numeric comparison.

```bash
test_file_has_more_than_zero_lines() {
  assert_greater_than "0" "$(count_lines "$TEMP_FILE")"
}
```

### `set_up` / `tear_down`
Run before and after each test in a file. Useful for creating and cleaning up temp files or state.

```bash
set_up() {
  TEMP_FILE="$(mktemp)"
  printf "line one\nline two\nline three\n" > "$TEMP_FILE"
}

tear_down() {
  rm -f "$TEMP_FILE"
}
```

---

## Key conventions

- **Test files** must end in `_test.sh`
- **Test functions** must start with `test_`
- `set_up` and `tear_down` are optional hooks per file
- Each test function is independent — no shared state between tests

---

## Links

- [bashunit docs](https://bashunit.typeddevs.com)
- [bashunit on GitHub](https://github.com/TypedDevs/bashunit)
- [TypedDevs org](https://github.com/TypedDevs)
