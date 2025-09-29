#!/usr/bin/env python3

import subprocess
from pathlib import Path
from typing import List

import utill

def dot_install(order: list[str]) -> None:
    unknown_list, is_valid = utill.validate_dot_list(order)
    if not is_valid:
        print("your order contains invalid dotfile")
        print("Unknown: ", unknown_list)
        return

    args = ["stow", "-t", str(Path.home())] + order

    try:
        subprocess.run(args)
    except subprocess.CalledProcessError as e:
        print(e)


def dot_uninstall(order: list[str]) -> None:
    pass


def dot_update(order: List) -> None:
    unknown_list, is_valid = utill.validate_dot_list(order)
    if not is_valid:
        print("your order contains invalid dotfile")
        print("Unknown: ", unknown_list)
        return

    dot_uninstall(order)
    dot_install(order)
