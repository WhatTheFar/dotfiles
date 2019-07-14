#!/usr/bin/env bash

RESET=`tput sgr0`
GREEN=`tput setaf 32`
BLUE=`tput setaf 34`

dotfiles=`find . -type f -name "*" -path "./config/*" | sed 's/^\.\/config\///'`

echo "> Initializing..."
echo

for file in $dotfiles
do
    echo -e "$BLUE--- Linking $file ---$RESET"
    # rm "$HOME/$file"
    ln -sf "$(pwd)/config/$file" "$HOME/$file"
done