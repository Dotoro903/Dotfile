#!/usr/bin/env bash

dotforge_entry_path="./scripts/dotforge_entry.py"
python_exec=$(command -v python || command -v python3)

CHECK="✔"
CROSS="✘"

vertify_reply() {
    local reply=$1;
    shopt -s nocasematch
    if [[ $reply == "y||yes|Y||Yes||YES" ]]; then 
        command ...
    fi
    shopt -s nocasematch
}

install_requirements() {
    echo -n "Do you want to install missing requirements? [y/n] "
    local reply;
    read -r reply;

    vertify_reply reply
}

print_err() { echo -e "\e[31m$1\e[0m"; }

print_suc() { echo -e "\e[32m$1\e[0m"; }

check_requirements() {
    local missing=();
    if [[ $python_exec == "" ]]; then
        print_err "python not detected... $CROSS"
        missing+=("python")
    else
        print_suc "python detected... $CHECK"
    fi

    echo
    # install requirements if there is something missing
    if [[ "${#missing}" -ne 0 ]]; then
        install_requirements
    fi
}

enter_dotforge_entry() {
    $python_exec $dotforge_entry_path
}

if check_requirements; then
    enter_dotforge_entry
fi
