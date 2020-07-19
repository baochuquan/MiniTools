#!/bin/bash

source $MINI_ROOT/common/environment.sh
source $MINI_ROOT/tools/convert_time.sh

function _usage_of_tools() {
  echo "Usage:"
  echo "     $MINI_NAME tools"
  echo "Options:"
  echo "     --convert-color        convert timestamp related"
  echo "     --convert-time         convert color related"
  exit 1
}

function subcmd_dispatch_of_tools() {
  case $1 in
    $tools_option_convert_color)
      shift
      echo "$*"
      ;;
    $tools_option_convert_time)
      shift
      convert_time $*
      ;;
    *)
      _usage_of_tools
      ;;
  esac
}