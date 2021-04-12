#!/usr/bin/env bash

RESET=`tput sgr0`
BLUE=`tput setaf 30`

echo -e "$BLUE--- Installing Zinit ---$RESET"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

