#!/bin/bash

source $MINI_ROOT/common/environment.sh

function _usage_of_review() {
  echo "Usage:"
  echo "     $MINI_NAME review"
  echo "Options:"
  echo "     --submit-gerrit        submit code review to gerrit"
  echo "     --init-git             init git"
  exit 1
}

function subcmd_dispatch_of_review() {
  case $1 in
    $review_option_submit_gerrit)
      shift
      echo "$*"
      ;;
    $review_option_init_git)
      shift
      echo "$*"
      ;;
    *)
      _usage_of_review
      ;;
  esac
}