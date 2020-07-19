#!/bin/bash

source $MINI_ROOT/common/environment.sh

function _usage_of_build() {
  echo "Usage:"
  echo "     $MINI_NAME build"
  echo "Options:"
  echo "     --ios-bugly            upload bugly for ios project"
  echo "     --ios-jenkins          build ios project in jenkins"
  echo "     --ios-build            build ios project"
  exit 1
}

function subcmd_dispatch_of_build() {
  echo "$*"
  case $1 in
    $build_option_ios_bugly)
      shift
      echo "$*"
      ;;
    $build_option_ios_jenkins)
      shift
      echo "$*"
      ;;
    $build_option_ios_build)
      shift
      echo "$*"
      ;;
    *)
      _usage_of_build
      ;;
  esac
}