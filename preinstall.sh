#!/bin/bash

export HOMEBREW_NO_AUTO_UPDATE=1
_INSTALLED_BREWS=`brew list`

if brew list | grep "bash-completion"; then 
  echo "bash-completion has installed."
else 
  echo "Installing bash-completion"
  brew install bash-completion && echo "[[ -r \"/usr/local/etc/profile.d/bash_completion.sh\" ]] && . \"/usr/local/etc/profile.d/bash_completion.sh\"" >> ~/.zshrc
fi 
