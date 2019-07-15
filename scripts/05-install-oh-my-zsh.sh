#!/usr/bin/env bash

RESET=`tput sgr0`
BLUE=`tput setaf 30`

# Install Oh My Zsh
echo -e "$BLUE--- Installing Oh My Zsh ---$RESET"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo

# Install powerlevel9k for Oh-My-ZSH
# https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-2-install-for-oh-my-zsh
echo -e "$BLUE--- Installing Powerlevel9k theme ---$RESET"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k 2> /dev/null

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

echo 
./scripts/00-linking-dotfiles.sh