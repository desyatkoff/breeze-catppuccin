#!/usr/bin/env bash

set -euo pipefail

IFS=$'\n\t'

if ! command -v inkscape &>/dev/null; then
    echo "error: \`inkscape\` not found"

    exit 1
fi

if ! command -v xcursorgen &>/dev/null; then
    echo "error: \`xcursorgen\` not found"

    exit 1
fi

if [[ ! -d ".git" && ! -d "Breeze-Catppuccin" && ! -f "install.sh" ]]; then
    if ! command -v git &>/dev/null; then
        echo "error: \`git\` not found"

        exit 1
    fi

    git clone https://github.com/desyatkoff/breeze-catppuccin.git

    cd breeze-catppuccin/
fi

cd Breeze-Catppuccin/

bash ../src/build.sh

cp -r \
    Breeze_Catppuccin/ \
    ~/.local/share/icons/Breeze-Catppuccin/
