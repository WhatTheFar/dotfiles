#!/usr/bin/env bash

RESET=`tput sgr0`
BLUE=`tput setaf 30`

VERSION=$(docker-compose version --short)

# Install dokcer bash completion for homebrew docker
sudo curl -L https://raw.githubusercontent.com/docker/compose/$VERSION/contrib/completion/bash/docker-compose -o "$(brew --prefix)/etc/bash_completion.d/docker-compose"
