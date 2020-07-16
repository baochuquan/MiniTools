#!/bin/bash

_DEFAULT="mini"

if which $_DEFAULT; then
  echo "mini exist"
else 
  echo "mini not exist"
fi

_TARGET=~/usr/local/bin/mini
if [ ! -e $_TARGET ]; then 
  echo "HHHHH"
fi
#install ./mini.sh ~/usr/local/bin/mini
