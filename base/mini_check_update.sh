#!/bin/bash -x

_REMOTE_URL=`git ls-remote --get-url origin`
_LATEST_COMMIT=`git ls-remote ${_REMOTE_URL} HEAD | xargs -n 1 | head -n 1`
_CURRENT_COMMIT=`git rev-parse HEAD`

if [ $_LATEST_COMMIT == $_CURRENT_COMMIT ]; then
  echo "Repository updated!"
else
  echo "Repository Same!"
fi
