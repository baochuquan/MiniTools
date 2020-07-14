#!/bin/bash -x

_REMOTE_URL=`git ls-remote --get-url origin`
_LATEST_COMMIT=`git ls-remote ${_REMOTE_URL} HEAD`
echo $_REMOTE_URL
echo $_LATEST_COMMIT


