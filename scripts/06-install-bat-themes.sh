#!/usr/bin/env bash

THEME_DIR="$(bat --config-dir)/themes"
CACHE_DIR="$(bat --cache-dir)"

mkdir -p $THEME_DIR
mkdir -p $CACHE_DIR

pushd $THEME_DIR

git clone https://github.com/dracula/sublime.git "Dracula"

bat cache --build

popd
