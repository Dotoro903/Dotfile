#!/usr/bin/env bash

source ./scripts/printer.sh
source ./scripts/install_dotfile.sh
source ./scripts/install_package.sh

## Edit this variable if you want to change root environment
readonly DOT=$HOME/dot
readonly DOTFILE=$HOME/dot/dotfile
readonly DOTLOC=$HOME/dot/dotlocal
readonly INSTALL=$HOME/dot/dotfile/Install
readonly INSTALL_IGNORE=$HOME/dot/dotfile/.install_ignore

echo_err() {
    echo -e "\e[31mERR: $1\e[0m"
}

echo_warning() {
    echo -e "\e[33m$1\e[0m"
}

echo_quest() {
    echo -e "\e[34m$1\e[0m"
}

echo_comment() {
    echo -e "\e[38;5;245m$1\e[0m"
}

validate_dir_tree() {

    local has_occurred_error=0

    if [[ -z $DOT ]]; then # Check if DOT is empty
        echo_err "\$DOT is empty!, edit this script file and set \$DOT"
        exit 2
    fi

    if [[ ! -d "$DOT" ]]; then # Check if ENV exists
        echo_err "There is no '$DOT' directory!"
        has_occurred_error=1
    fi

    if [[ ! -d "$DOTFILE" ]]; then # Check if DOT/dotfile exists;
        echo_err "There is no '$DOTFILE' directory!"
        has_occurred_error=1
    fi

    if [[ ! -d "$DOTLOC" ]]; then # Check if DOT/dotlocal exists
        echo_err "There is no '$DOTLOC' directory!"
        has_occurred_error=1
    fi

    if [[ ! -d "$INSTALL" ]]; then #Check if DOT/dotfile/Intall exists
        echo_err "There is no '$INSTALL' directory!"
        has_occurred_error=1
    fi

    if [[ $has_occurred_error -eq 1 ]]; then
        print_structure
        echo_err "exit with code 1"
        exit 1
    fi
}

check_install_ignore() {
    if [[ $1 == '-s' ]]; then
        if [[ -f "$INSTALL_IGNORE" ]]; then
            echo 0
        else
            echo 1
        fi
    elif [[ ! -f "$INSTALL_IGNORE" ]]; then
        echo_warning "There is no $INSTALL_IGNORE file."
        echo_warning "It is recommended to create one, and add 'Install'"
    fi
}

detect_distribute() {
    local -n out="$1"

    if grep -i "Arch" /etc/os-release >/dev/null 2>&1; then
        out="Arch"
    elif grep -Ei "Ubuntu|Debian" /etc/os-release >/dev/null 2>&1; then
        out="Ubuntu"
    fi
}

inst() {
    local target=("${!1}")
    if [[ "$distribute" == 'Arch' ]]; then
        sudo pacman -S "${target[@]}" --noconfirm --needed
    elif [[ "$distribute" == 'Ubuntu' ]]; then
        sudo apt install "${target[@]}" -y
    fi
}

get_pkglist() {
    local pkg=()

    mapfile -t pkg <"$DOTLOC/.pkglist"

    for p in "${pkg[@]}"; do
        echo -n "$p "
    done
}

get_dots() {

    local dotfile=()
    local dotlocal=()

    for path in "$DOTFILE"/* "$DOTLOC"/*; do
        local dir
        dir=$(basename "$path") # Array with directory name
        parent=$(dirname "$path")

        local ignore=() # Array to ignore
        if [[ $(check_install_ignore -s) -eq 0 ]]; then
            mapfile -t ignore <"$INSTALL_IGNORE"
        fi

        local finded_to_ignore=0
        for ig in "${ignore[@]}"; do
            if [[ "$dir" == "$ig" ]]; then
                finded_to_ignore=1
            fi
        done
        if [[ $finded_to_ignore -eq 1 ]]; then continue; fi

        if [[ "$parent" == "$DOTFILE" ]]; then
            dotfile+=("$dir")
        else
            dotlocal+=("$dir")
        fi
    done

    if [[ "$1" == "dotlocal" ]]; then
        for d in "${dotlocal[@]}"; do
            echo -n "$d "
        done
    elif [[ "$1" == "dotfile" ]]; then
        for d in "${dotfile[@]}"; do
            echo -n "$d "
        done
    else
        for d in "${dotlocal[@]}"; do
            echo -n "$d "
        done
        for d in "${dotfile[@]}"; do
            echo -n "$d "
        done
    fi
}

get_dotlocal() { get_dots dotlocal; }

get_dotfile() { get_dots dotfile; }

array_contains() {
    local needle="$1"
    shift
    local x
    for x in "$@"; do [[ "$x" == "$needle" ]] && return 0; done
    return 1
}

fill_from_provider() {
    local -n __out="$1"
    shift
    local provider="$1"
    read -r -a __out <<<"$("$provider")"
}

resolve_selection() {
    local -n _out="$1"
    shift
    local -a _sel=("${!1}")
    shift
    local all_token="$1"
    shift
    local provider="$1"

    if ((${#_sel[@]} == 0)) || array_contains "$all_token" "${_sel[@]}"; then
        fill_from_provider _out "$provider"
    else
        _out=("${_sel[@]}")
    fi
}

print_prompt() {
    local default=$1
    shift

    if [[ "$1" == "-r" ]]; then
        echo -n "[default=$default/'r' to go back] > "

    else
        echo -n "[default=$default] > "
    fi
}

countdown() {
    local count=$1
    for ((i=1; i<=count; i++)); do
        for ((j=1; j<5; j++)); do
            echo -n "."
            sleep 0.2
        done
        echo -n "$i"
    done
}

main() {

    print_foreword

    # Validation
    validate_dir_tree
    check_install_ignore
    echo

    print_menu
    print_prompt 3
    read -r -a selections
    echo

    if ((${#selections[@]} == 0)) || array_contains "3" "${selections[@]}"; then
        selections=(1 2)
    fi

    echo '------------------------------------------------------------------'

    local packageIndex=1
    local dotfileIndex=2

    if array_contains $packageIndex "${selections[@]}"; then
        local package_input=()
        print_package_menu
        print_prompt "all" -r
        read -r -a package_input
        local package_sel=()
        echo

        resolve_selection package_sel package_input[@] "all" get_pkglist

        echo '------------------------------------------------------------------'
    fi
    if array_contains $dotfileIndex "${selections[@]}"; then

        local dotfile_input=()
        print_dotfile_menu
        print_prompt "all" -r
        read -r -a dotfile_input
        local dotfile_sel=()
        local dotlocal_sel=()
        echo

        resolve_selection dotfile_sel dotfile_input[@] "all" get_dotfile
        resolve_selection dotlocal_sel dotfile_input[@] "all" get_dotlocal

        echo '------------------------------------------------------------------'
    fi

    echo_warning "selected dotfile: "
    for i in "${dotfile_sel[@]}"; do
        echo -n "$i "
    done
    echo

    echo_warning "selected dotfile(local): "
    for i in "${dotlocal_sel[@]}"; do
        echo -n "$i "
    done
    echo

    echo_warning "selected package: "
    for i in "${package_sel[@]}"; do
        echo -n "$i "
    done
    echo
    echo

    local flag
    echo -ne "\e[34mCommit your selections? [y/n] \e[0m"
    read -r flag

    if [[ "$flag" == "y" ]]; then

        echo -n "installing in"
        countdown 3
        echo

        handle_needed_dotfile
        install_dotfile dotfile_sel[@] "$DOTFILE"
        install_dotfile dotlocal_sel[@] "$DOTLOC"

        install_packages package_sel[@]

        echo
        echo_quest "-- Finished all instalation successfully!"

    else
        exit 0
    fi
}

main "$@"
