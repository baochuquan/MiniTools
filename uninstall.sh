#!/bin/bash

if [ ! -e .config ]; then
  echo "mini has not installed"
  exit 0
fi

_NAME=`cat .config`
_TARGET="/usr/local/bin/${_NAME}"
rm $_TARGET
rm .config
echo "Uninstall $_NAME successfully!"

