#!/bin/bash

if [ -e .config ]; then
  echo "mini has installed"
  exit 0
fi

_DEFAULT="mini"
_NAME=$_DEFAULT

read -p "The tool will be named 'mini' by default. Do you want to use a personalized name? (yes/no)" _CUSTOMIZE

if [ "$_CUSTOMIZE" == "yes" ]; then
  read -p "please input the personalized name for the tool: " _NAME
  
  while [ -z $_NAME ] || which $_NAME
  do
    if [ -z $_NAME ]; then
      read -p "The name cannot be empty, please give another name: " _NAME
    elif which $_NAME; then
      read -p "$_NAME has already installed, please give another name: " _NAME
    fi
  done
fi

_TARGET="/usr/local/bin/${_NAME}"
echo "$_NAME" > .config
install ./mini.sh $_TARGET

_CURRENT_ROOT=`pwd`
echo "# MiniTools configurations" >> ~/.zshrc
echo "autoload bashcompinit" >> ~/.zshrc
echo "bashcompinit" >> ~/.zshrc
echo "source $_CURRENT_ROOT/base/completion.bash" >> ~/.zshrc

echo "========================================="
echo "                  LOGO                   "
echo "========================================="
echo "$_NAME installed successfully!"


