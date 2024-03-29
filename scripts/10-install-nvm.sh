#!/usr/bin/env bash

###################################
# Run this before installing yarn #
###################################

RESET=`tput sgr0`
BLUE=`tput setaf 30`

# Find script directory (no support for symlinks)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install or update nvm
# https://github.com/nvm-sh/nvm
# echo -e "$BLUE--- Installing nvm ---$RESET"
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# install volta
echo -e "$BLUE--- Installing volta ---$RESET"
# '--skip-setup' Do not run 'volta setup' to modify startup scripts
curl https://get.volta.sh | bash -s -- --skip-setup
# run volta setup to manually configure your shell to use Volta
