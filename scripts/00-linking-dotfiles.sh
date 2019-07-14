#!/usr/bin/env bash

RESET=`tput sgr0`
BLUE=`tput setaf 30`

dir="dotfiles"
dotfiles=`find . -type f -name "*" -path "./${dir}/*" | sed "s/^\.\/${dir}\///"`

for file in $dotfiles
do
    echo -e "$BLUE--- Linking $file ---$RESET"

    ln -sf "$(pwd)/$dir/$file" "$HOME/$file"
done