#!/usr/bin/env bash

add() {
  echo $(( $1 + $2 ))
}

subtract() {
  echo $(( $1 - $2 ))
}

multiply() {
  echo $(( $1 * $2 ))
}

divide() {
  local dividend=$1
  local divisor=$2
  if [[ $divisor -eq 0 ]]; then
    echo "error: division by zero"
    return 1
  fi
  echo $(( dividend / divisor ))
}
