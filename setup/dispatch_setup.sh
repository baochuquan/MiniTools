#!/bin/bash

source $MINI_ROOT/common/environment.sh

function _usage_of_setup() {
  echo "Usage:"
  echo "     $MINI_NAME setup"
  echo "Options:"
  echo "     --ios-env              setup ios environment"
  echo "     --ios-proj             setup ios project for develop"
  exit 1
}

function subcmd_dispatch_of_setup() {
  case $1 in
    $setup_option_ios_env)
      shift
      echo "$*"
      ;;
    $setup_option_ios_proj)
      shift
      echo "$*"
      ;;
    *)
      _usage_of_setup
      ;;
  esac
}