#!/bin/bash

source $MINI_ROOT/common/environment.sh
source $MINI_ROOT/build/dispatch_build.sh
source $MINI_ROOT/config/dispatch_config.sh
source $MINI_ROOT/review/dispatch_review.sh
source $MINI_ROOT/setup/dispatch_setup.sh
source $MINI_ROOT/tools/dispatch_tools.sh


function _mini_usage() {
  echo "Usage:"
  echo "     $MINI_NAME [--help]"
  echo "            <command> [<args>]"
  echo ""
  echo "These are common $MINI_NAME commands used in various situations:"
  echo ""
  echo "Build a iOS project related"
  echo "    build"
  echo ""
  echo "Settings of MiniTools"
  echo "    config"
  echo ""
  echo "Code review related"
  echo "    review"
  echo ""
  echo "Start from scratch for an iOS project"
  echo "    setup"
  echo ""
  echo "Messy up tools"
  echo "    tools"
  echo ""
  echo "'$MINI_NAME help -a' and '$MINI_NAME help -g' list available subcommands and some concept guides."
  echo ""
  exit 1
}

# Main Dispatch
function _main_dispatch() {
  case $1 in
    $subcmd_config)
      shift
      subcmd_dispatch_of_config $*
      ;;
    $subcmd_setup)
      shift
      subcmd_dispatch_of_setup $*
      ;;
    $subcmd_build)
      shift
      subcmd_dispatch_of_build $*
      ;;
    $subcmd_review)
      shift
      subcmd_dispatch_of_review $*
      ;;
    $subcmd_tools)
      shift
      subcmd_dispatch_of_tools $*
      ;;
    *)
      _mini_usage
      ;;
  esac
}

# Main Entry Point
if [ $# -eq 0 ]; then
  _mini_usage;
  exit 1
fi

_main_dispatch $*
