#!/bin/bash

source $MINI_ROOT/common/show_logo.sh

function _usage_of_change_name() {
  echo "Usage:"
  echo "     $MINI_NAME config --change-name"
  echo "Example:"
  echo "     $MINI_NAME config --change-name <newname>        change $MINI_NAME to <newname>"
  exit 1
}

function change_name() {
  if [ $# -ne 1 ]; then
    _usage_of_change_name
    return
  fi
  
  if which $1; then
  	echo "The '$1' is exisited, please input another name."
  	return 0
  fi

  local _OLD="/usr/local/bin/$MINI_NAME"
  local _NEW="/usr/local/bin/$1"

  if [ -e $_OLD ]; then
    rm $_OLD
  fi
  ln -s $MINI_ROOT/mini.sh $_NEW
  
  local minirc=$MINI_ROOT/.minirc
  if [ -e $minirc ]; then
  	rm $minirc
  fi
  touch $MINI_ROOT/.minirc
  
  MINI_NAME="$1"
  echo "export MINI_ROOT=\"$MINI_ROOT\"" >> $minirc
  echo "export MINI_NAME=\"$MINI_NAME\"" >> $minirc
  echo "autoload bashcompinit" >> $minirc
  echo "bashcompinit" >> $minirc
  echo "source $MINI_ROOT/common/completion.bash" >> $minirc

  echo ""
  show_logo
  echo ""
  echo -e "\033[32mchange name successful!\033[0m"
  echo ""
  echo "please relaunch your z-shell or execute the following command:"
  echo "     source ~/.zshrc"
}
