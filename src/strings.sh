#!/usr/bin/env bash

# Greet a user by name
greet() {
  local name="${1:-World}"
  echo "Hello, ${name}!"
}

# Check if a string is a valid email (basic pattern)
is_valid_email() {
  local email="$1"
  [[ "$email" =~ ^[^@]+@[^@]+\.[^@]+$ ]]
}

# Reverse a string
reverse_string() {
  echo "$1" | rev
}

# Count words in a string
count_words() {
  echo "$1" | wc -w | tr -d ' '
}
