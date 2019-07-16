#!/usr/bin/env bash

RESET=`tput sgr0`
BLUE=`tput setaf 30`

# Install dokcer bash completion for homebrew docker
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.24.0/contrib/completion/bash/docker-compose -o "$(brew --prefix)/etc/bash_completion.d/docker-compose"
