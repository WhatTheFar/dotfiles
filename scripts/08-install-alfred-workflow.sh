#!/usr/bin/env bash

RESET=`tput sgr0`
BLUE=`tput setaf 30`

# install alfred workflows created by using alfy. https://github.com/sindresorhus/alfy

# https://github.com/SamVerschueren/alfred-updater
yarn global add afred-updater

# https://github.com/bchatard/alfred-jetbrains
yarn global add @bchatard/alfred-jetbrains