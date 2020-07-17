#!/bin/bash

_DEFAULT="mini"
_TARGET="/usr/local/bin/${_DEFAULT}"

if which $_DEFAULT; then
  echo "[!] $_DEFAULT has installed."
else 
  echo "========================================="
  echo "                  LOGO                   "
  echo "========================================="
  install ./mini.sh $_TARGET
  echo "$_DEFAULT installed successfully!"
fi
