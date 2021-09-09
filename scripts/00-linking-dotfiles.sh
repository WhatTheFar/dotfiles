#!/usr/bin/env bash

RESET=`tput sgr0`
BLUE=`tput setaf 30`

src="src"
entire_dirs=(
    '.config/karabiner'
    '.config/lvim/lsp-settings'
    '.hammerspoon'
)

dotfiles=`find . -type f -name "*" -path "./${src}/*" | sed "s/^\.\/${src}\///"`
linked_dirs=()
linked_dirs_re=""

path_to_regex() {
    echo $@ | sed -e 's/\([\/\.]\)/\\\1/g'
}

for file in $dotfiles
do
    if [[ "$file" =~ ${linked_dirs_re} ]]; then
        echo -e "$BLUE--- Skipping $file ---$RESET"
        continue
    fi

    skip=""
    for entire_dir in ${entire_dirs[@]}
    do
        re="^$(path_to_regex $entire_dir)\\/.*\$"
        if [[ "$file" =~ $re ]]; then
            echo -e "$BLUE--- Linking $entire_dir ---$RESET"
            # mkdir -p "$HOME/$entire_dir"
            rm -rf "$HOME/$entire_dir"
            ln -s "$(pwd)/$src/$entire_dir" "$HOME/$entire_dir"

            linked_dirs=("${linked_dirs[@]}" "${entire_dir}")
            linked_dirs_re="^($(echo "${linked_dirs[@]}" | sed -e 's/\([\/\.]\)/\\\1/g' -e 's/ /|/g')).*$"
            skip=true

            break
        fi
    done
    if [[ -n $skip ]]; then
        echo -e "$BLUE--- Skipping $file ---$RESET"
        continue
    fi

    echo -e "$BLUE--- Linking $file ---$RESET"
    mkdir -p "$HOME/$(dirname $file)"
    ln -sf "$(pwd)/$src/$file" "$HOME/$file"
done

