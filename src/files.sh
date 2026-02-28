#!/usr/bin/env bash

# Count lines in a file
count_lines() {
  local file="$1"
  if [[ ! -f "$file" ]]; then
    echo "error: file not found"
    return 1
  fi
  wc -l < "$file" | tr -d ' '
}

# Check if a file has a given extension
has_extension() {
  local file="$1"
  local ext="$2"
  [[ "$file" == *."$ext" ]]
}
