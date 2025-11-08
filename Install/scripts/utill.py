#!/usr/bin/env python3

from pathlib import Path
from typing import List, Tuple

# file & directory vars
DOT_ROOT = Path.home() / "dot/dotfile"
DOT_IGNORE = DOT_ROOT / ".dot_ignore"


def _get_dot_dir_list() -> List[str]:
    dot = []
    for d in DOT_ROOT.iterdir():
        if d.is_dir() and not d.name.startswith("."):
            dot.append(d.name)
    return dot


def get_dot_ignore_list() -> List[str]:
    with open(DOT_IGNORE, "r", encoding="utf-8") as f:
        ignores = [line.strip() for line in f]
    return ignores


def get_dot_list() -> List[str]:
    ignores = get_dot_ignore_list()
    dirs = _get_dot_dir_list()

    dots = []
    for d in dirs:
        if d not in ignores:
            dots.append(d)
    return dots


def validate_dot_list(target: List[str]) -> Tuple[List[str], bool]:
    unknown_list = []
    is_valid = True
    for t in target:
        if t not in get_dot_list():
            unknown_list.append(t)
            is_valid = False
    return (unknown_list, is_valid)

def main():
    dirs = _get_dot_dir_list()
    print(dirs)

    ignores = get_dot_ignore_list()
    print(ignores)

    dots = get_dot_list()
    print(dots)


if __name__ == "__main__":
    main()
