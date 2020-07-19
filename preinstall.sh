#!/bin/bash

export HOMEBREW_NO_AUTO_UPDATE=1
_INSTALLED_BREWS=`brew list`

echo "checking bash-completion..."
if $_INSTALLED_BREWS | grep "bash-completion"; then 
  echo "bash-completion has installed."
else 
  echo "installing bash-completion..."
  echo "# bash-completion configuration" >> ~/.zshrc
  brew install bash-completion && echo "[[ -r \"/usr/local/etc/profile.d/bash_completion.sh\" ]] && . \"/usr/local/etc/profile.d/bash_completion.sh\"" >> ~/.zshrc
  echo "" >> ~/.zshrc
fi

# echo "checking gnu-sed..."
# if $_INSTALLED_BREWS | grep "gnu-sed"; then 
#   echo "gnu-sed has installed."
# else
#   echo "installing gnu-sed..."
#   brew install gnu-sed
# fi

