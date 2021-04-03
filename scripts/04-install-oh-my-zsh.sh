#!/usr/bin/env bash

RESET=`tput sgr0`
BLUE=`tput setaf 30`

# Install Oh My Zsh
# echo -e "$BLUE--- Installing Oh My Zsh ---$RESET"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# echo

# Install powerlevel10k for Oh-My-ZSH
# https://github.com/romkatv/powerlevel10k#oh-my-zsh
echo -e "$BLUE--- Installing Powerlevel10k theme ---$RESET"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k 2> /dev/null

# Install zsh-completions for Oh-My-ZSH
# https://github.com/zsh-users/zsh-completions#oh-my-zsh
echo -e "$BLUE--- Installing zsh-completions plugin ---$RESET"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions 2> /dev/null

# Install zsh-autosuggestions for Oh-My-Zsh
# https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-2-install-for-oh-my-zsh
echo -e "$BLUE--- Installing zsh-autosuggestions plugin ---$RESET"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2> /dev/null

# Install zsh-syntax-highlighting for Oh-My-ZSH
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
echo -e "$BLUE--- Installing zsh-syntax-highlighting plugin ---$RESET"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2> /dev/null

# Install fzf-tab for Oh-My-ZSH
# https://github.com/Aloxaf/fzf-tab
echo -e "$BLUE--- Installing fzf-tab plugin ---$RESET"
git clone https://github.com/Aloxaf/fzf-tab.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/fzf-tab 2> /dev/null

# Install
# https://github.com/jeffreytse/zsh-vi-mode
echo -e "$BLUE--- Installing zsh-vi-mode plugin ---$RESET"
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-vi-mode 2> /dev/null

# Find script directory (no support for symlinks)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo
$DIR/00-linking-dotfiles.sh
