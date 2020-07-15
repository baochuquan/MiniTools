#!/bin/bash -x

_REMOTE_URL=`git ls-remote --get-url origin`
_REMOTE_COMMIT=`git ls-remote ${_REMOTE_URL} HEAD | xargs -n 1 | head -n 1`
_CURRENT_COMMIT=`git rev-parse HEAD`

if [[ $_REMOTE_COMMIT == $_CURRENT_COMMIT ]];then
  # Same commit, do not need to update
  echo "Same Commit, do not need to update"
elif git merge-base --is-ancestor $_REMOTE_COMMIT $_CURRENT_COMMIT;then
  # Local commit is based on remote commit
  echo "Local commit is based on remote commit, do not need to update"
else
  # Local branch is behind remote commit, and have new unmerged commit
  echo "Local branch is behind remote branch, and have unsubmitted local commit,
  need to update"
fi
