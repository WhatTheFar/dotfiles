#!/usr/bin/env bash

RESET=`tput sgr0`
BLUE=`tput setaf 30`

PROFILE_DIR=~/Library/Application\ Support/iTerm2/DynamicProfiles

dir="iterm2_profile"
profiles=`find . -type f -name "*" -path "./${dir}/*" | sed "s/^\.\/${dir}\///"`

for file in $profiles
do
    echo -e "$BLUE--- Linking $file ---$RESET"

    ln -sf "$(pwd)/$dir/$file" "$PROFILE_DIR/$file"
done