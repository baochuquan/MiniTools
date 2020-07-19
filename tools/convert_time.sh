#!/bin/bash

function _usage_of_convert_time() {
  echo "Usage:"
  echo "     $MINI_NAME tools --convert-time"
  echo "Options:"
  echo "     -s        convert timestamp(unit: s) to date"
  echo "     -ms       convert timestamp(unit: ms) to date"
  echo "     -ns       convert timestamp(unit: ns) to date"
  exit 1
}

function convert_time() {
  if [ $# -ne 2 ]; then
    _usage_of_convert_time
    return
  fi
  local timestamp
  local multiple
  case $1 in
    -s)
      shift
      multiple=1000
      ;;
    -ms)
      shift
      multiple=1
      ;;
    -ns)
      shift
      multiple=0.001
      ;;
    *)
      shift
      _usage_of_convert_time
      return
      ;;
  esac
  timestamp=`echo "$multiple * $1" | bc | cut -d '.' -f1`
  date -r $timestamp
}
