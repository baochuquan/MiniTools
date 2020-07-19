#!/bin/bash

source $MINI_ROOT/common/environment.sh
source $MINI_ROOT/config/change_name.sh

function _usage_of_config() {
  echo "Usage:"
  echo "     $MINI_NAME config"
  echo "Options:"
  echo "     --change-name          modify $MINI_NAME to a new name"
  exit 1
}

function subcmd_dispatch_of_config() {
  case $1 in
    $config_option_change_name)
      shift
      change_name $*
      ;;
    *)
      _usage_of_config
      ;;
  esac
}