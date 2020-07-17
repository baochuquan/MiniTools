#!/bin/bash

#if ! which brew; then
#  echo "Installing brew ..."
#  /usr/bin/ruby -e "$(curl -fsSL
#  https://raw.githubusercontent.com/Homebrew/install/master/install)"
#fi

_INSTALLED_BREWS=`brew list`

if brew list | grep "bash-completion"; then 
  echo "bash-completion has installed."
else 
  echo "Installing bash-completion"
  brew install bash-completion && echo "[[ -r
  \"/usr/local/etc/profile.d/bash_completion.sh\" ]] &&
    . \"/usr/local/etc/profile.d/bash_completion.sh\"" >> ~/.bash_profile
  source ~/.bash_profile
fi 


