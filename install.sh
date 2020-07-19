#!/bin/bash

source ./common/show_logo.sh

if [ -e .config ]; then
  echo "mini has installed"
  exit 0
fi

MINI_ROOT=`pwd`
MINI_NAME="mini"

read -p "The tool will be named 'mini' by default. Do you want to use a personalized name? (no/yes) :" _CUSTOMIZE

if [ "$_CUSTOMIZE" == "yes" ]; then
  read -p "please input the personalized name for the tool: " MINI_NAME
  
  while [ -z $MINI_NAME ] || which $MINI_NAME
  do
    if [ -z $MINI_NAME ]; then
      read -p "The name cannot be empty, please give another name: " MINI_NAME
    elif which $MINI_NAME; then
      read -p "$MINI_NAME has already installed, please give another name: " MINI_NAME
    fi
  done
fi

_TARGET="/usr/local/bin/${MINI_NAME}"
ln -s $MINI_ROOT/mini.sh $_TARGET

echo "export MINI_ROOT=\"$MINI_ROOT\"" >> .minirc
echo "export MINI_NAME=\"$MINI_NAME\"" >> .minirc
echo "autoload bashcompinit" >> .minirc
echo "bashcompinit" >> .minirc
echo "source $MINI_ROOT/common/completion.bash" >> .minirc

echo "source $MINI_ROOT/.minirc" >> ~/.zshrc

echo ""
show_logo
echo ""
echo -e "\033[32m$MINI_NAME has been installed successfully!\033[0m"
echo ""
echo "please relaunch your z-shell or execute the following command:"
echo "     source ~/.zshrc"

