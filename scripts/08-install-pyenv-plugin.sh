#!/usr/bin/env bash

RESET=`tput sgr0`
BLUE=`tput setaf 30`

# Find script directory (no support for symlinks)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# https://github.com/pyenv/pyenv-which-ext
echo -e "$BLUE--- Installing pyenv-which-ext as pyenv plugin ---$RESET"
git clone https://github.com/pyenv/pyenv-which-ext.git $(pyenv root)/plugins/pyenv-which-ext
