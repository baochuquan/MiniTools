#!/bin/bash -x

_REMOTE_URL=`git ls-remote --get-url origin`
_REMOTE_COMMIT=`git ls-remote ${_REMOTE_URL} HEAD | xargs -n 1 | head -n 1`
_CURRENT_COMMIT=`git rev-parse HEAD`

function _git_is_ancestor() 
{
  if git merge-base --is-ancestor $1 $2; then
    echo 'ancestor'
  elif git merge-base --is-ancestor $2 $1; then
    echo 'descendant'
  else
    echo 'Unrelated'
  fi
}

_RELATION=`_git_is_ancestor $_REMOTE_COMMIT $_CURRENT_COMMIT`

if [[ $_RELATION == "ancestor" ]];then
  echo "Need update"
fi


