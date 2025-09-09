#!/usr/bin/env bash

source ../Install.sh

install_stow() {
    local distribute
    detect_distribute distribute

    inst stow
}

handle_needed_dotfile() {
    if ! command -v stow >/dev/null 2>&1; then
        echo "stow not detected, installing stow"
        install_stow
        echo "finished installing stow! proceed instalation"
    else
        echo "stow detected, proceed instalation"
    fi
}

install_dotfile() {
    local -a order=("${!1}")
    local dir=$2

    if command -v stow >/dev/null 2>&1; then
        if $(command -v stow) -d "$dir" -t "$HOME" "${order[@]}"; then
            echo_warning "${order[*]} from $dir has been installed"
        fi

    else
        exit 1
    fi
}
