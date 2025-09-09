#!/usr/bin/env bash

source ../Install.sh

install_packages() {
    local -a order=("${!1}")
    local distribute
    detect_distribute distribute

    inst order[@]
}

