#!/bin/bash

source $MINI_ROOT/config/environment.sh

function _mini_usage() {
  echo "usage: mini [--help]"
  echo "            <command> [<args>]"
  echo ""
  echo "These are common Mini commands used in various situations:"
  echo ""
  echo "start a iOS environment"
  echo "   setup"
  echo ""
  echo "'mini help -a' and 'mini help -g' list available subcommands and some
  concept guides."
  echo ""
}

# Subcmd Dispatch
function _subcmd_dispatch_of_config() {
  echo "config"
  case $1 in
    $config_option_change_name)
      shift
      ;;
   *)
  esac
}

function _subcmd_dispatch_of_setup() {
  echo "$*" 
}

function _subcmd_dispatch_of_build() {
  echo "build"
  echo "$*" 
}

function _subcmd_dispatch_of_review() {
  echo "review"
  echo "$*" 
}

function _subcmd_dispatch_of_tools() {
  echo "tools"
  echo "$*" 
}

# Main Dispatch
function _main_dispatch() {
  case $1 in
    $subcmd_config)
      shift
      _subcmd_dispatch_of_config $*
      ;;
    $subcmd_setup)
      shift
      _subcmd_dispatch_of_setup $*
      ;;
    $subcmd_build)
      shift
      _subcmd_dispatch_of_build $*
      ;;
    $subcmd_review)
      shift
      _subcmd_dispatch_of_review $*
      ;;
    $subcmd_tools)
      shift
      _subcmd_dispatch_of_tools $*
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
