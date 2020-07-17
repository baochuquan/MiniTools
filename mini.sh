#!/bin/bash

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

if [ $# -eq 0 ]; then
  _mini_usage;
  exit 1
fi

while getopts "i:b:" OPT; do
  case $OPT in
    i) echo "INIT";;
    b) TEST2="$OPTARG";;
    ?) _mini_usage;;
  esac 
done
