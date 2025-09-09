#!/usr/bin/env bash

source ../Install.sh

print_structure() {
    echo -e "\e[33m
Correct directory structure:

        $DOT
        │
        ├── dotfile
        │   └── Install
        │       └── Install.sh
        └── dotlocal

To change root environment directory, edit \$DOT variable inside this script file.
\e[0m"
}

print_foreword() {
    echo "================================================================================"
    echo ""
    echo -e "\e[31m     ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░▀█▀░█░░░█▀▀░░░▀█▀░█▀█░█▀▀░▀█▀░█▀█░█░░░█░░░█▀▀░█▀▄\e[0m"
    echo -e "\e[31m     ░█░█░█░█░░█░░█▀▀░░█░░░█░░█░░░█▀▀░░░░█░░█░█░▀▀█░░█░░█▀█░█░░░█░░░█▀▀░█▀▄\e[0m"
    echo -e "\e[31m     ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░░▀▀▀░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀\e[0m"
    echo ""
    echo ""
    echo -e "\e[38;5;245mAuthor     : Dotoro903\e[0m"
    echo -e "\e[38;5;245mRepository : https://github.com/Dotoro903/Dotfile\e[0m"
    echo ""

    echo "================================================================================"
    echo_warning "⚠️ Disclaimer"
    echo "This Install script is made for my personal environment."
    echo "It depends on my private files and directories which is not open in my public git repository."
    echo "It may not work on other system. I suggest to use it only as reference"
    echo ""
    echo "================================================================================"

}

print_menu() {
    echo_quest "What do you want to Install? [multi-select | number input]"
    echo_comment "(Use space as separator for multiple selections)"
    echo
    echo_comment "Options: "
    echo "1.package        2.dotfile        3.all"
    echo
}

print_dotfile_menu() {
    echo_quest "What dotfile do you want to apply? [multi-select | text input | default=all]"
    echo_comment "(Use space as separator for multiple selections)"
    echo
    echo_comment "Options: "

    local options=("all")
    read -r -a more_opts <<<"$(get_dots)"
    options+=("${more_opts[@]}")

    for d in "${options[@]}"; do
        echo -n "$d, "
    done
    echo
    echo
}

print_package_menu() {
    echo_quest "What package do you want to install? [multi-select | text input | default=all]"
    echo_comment "(Use space as separator for multiple selections)"
    echo
    echo_comment "Options: "

    get_pkglist

    echo
    echo
    # local options=("all")
    # read -r -a more_opts <<<"$(get_dotfile)"

}
