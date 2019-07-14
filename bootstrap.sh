#!/usr/bin/env bash

RESET=`tput sgr0`
GREEN=`tput setaf 32`
BLUE=`tput setaf 34`

scripts=`find . -type f -name "*" -path "./scripts/*" | sed 's/^\.\/scripts\///'`
# scripts=`find . -type f -name "*" -path "./scripts/*"`

echo "> Initializing..."
echo

for script in $scripts
do
    echo -e "$BLUE--- Executing $script ---$RESET"
    echo

    source "scripts/$script"

    echo
    echo -e "$GREEN--- Finished executing $script ---$RESET"
    echo
done