#!/usr/bin/env bash

RESET=$(tput sgr0)
GREEN=$(tput setaf 32)
BLUE=$(tput setaf 34)

dir="scripts"
# scripts=`find . -type f -name "*.sh" -path "./${dir}/*" | sed "s/^\.\/${dir}\///" | grep "^\d" | sort -n`
scripts=$(ls ${dir}/*.sh | sed "s/^${dir}\///" | grep "^\d")

echo "> Initializing..."
echo

for script in $scripts; do
	echo -e "$BLUE--- Executing $script ---$RESET"
	echo

	$dir/$script

	echo
	echo -e "$GREEN--- Finished executing $script ---$RESET"
	echo
done

