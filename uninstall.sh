#!/bin/bash

if [ ! -e .minirc ]; then
  echo "mini is not installed"
  exit 0
fi

_TARGET="/usr/local/bin/$MINI_NAME"
rm $_TARGET
rm .minirc
sed -i '' '/.minirc/d' ~/.zshrc
echo "Uninstall $MINI_NAME successfully!"

