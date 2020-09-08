#!/usr/bin/env bash

#
# Prerequisite: `install-pyenv-plugin.sh`
# since clang will be missing in virutalenv
# it require `pyenv-which-ext` plugin to install `pynvim`
#

RESET=`tput sgr0`
BLUE=`tput setaf 30`

# Find script directory (no support for symlinks)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo -e "$BLUE--- Init pyenv and virtualenv ---$RESET"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

VERSION=3.7.2

echo -e "$BLUE--- Installing pyenv 3.7.2 ---$RESET"
pyenv install --skip-existing 3.7.2

echo -e "$BLUE--- Creating pyenv virtualenv for neovim ---$RESET"
pyenv virtualenv 3.7.2 neovim

echo -e "$BLUE--- Installing pynvim in neovim ---$RESET"
pyenv activate neovim
pip3 install pynvim
pyenv deactivate
