#!/usr/bin/env bash

RESET=`tput sgr0`
GREEN=`tput setaf 32`
BLUE=`tput setaf 34`

dotfiles=`ls  .[^.]*`
exclude=( ".gitignore" ".git:")

echo "> Initializing..."
echo

for file in $dotfiles
do
    if [[ ! " ${exclude[@]} " =~ " ${file} " ]]; then
        echo -e "$BLUE--- Linking $file ---$RESET"
        echo
        ln -sf "$(pwd)/$file" "$HOME/$file"
        echo
    fi
done