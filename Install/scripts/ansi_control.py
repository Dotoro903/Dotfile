#!/usr/bin/env python3

import sys
from typing import Callable

ANSI_KEY_UP = b"\x1b[A"
ANSI_KEY_DOWN = b"\x1b[B"
ANSI_KEY_RIGHT = b"\x1b[C"
ANSI_KEY_LEFT = b"\x1b[D"
ANSI_KEY_EOX = b"\x03"


def cursor_up(dist: int):
    sys.stdout.write(f"\x1b[{dist}A")


def cursor_down(dist: int):
    sys.stdout.write(f"\x1b[{dist}B")


def cursor_right(dist: int):
    sys.stdout.write(f"\x1b[{dist}C")


def cursor_left(dist: int):
    sys.stdout.write(f"\x1b[{dist}D")


def move_cursor_by_relative_pos_row(relative_pos_row: int) -> Callable[[], None]:
    if relative_pos_row == 0:
        dist = abs(relative_pos_row)
        return lambda: None

    dist = abs(relative_pos_row)
    if relative_pos_row >= 0:
        cursor_down(dist)
        return lambda: cursor_up(dist)
    cursor_up(dist)
    return lambda: cursor_down(dist)


def set_cursor_visibility(is_visible: bool):
    if is_visible:
        sys.stdout.write(f"\x1b[?25h")
    else:
        sys.stdout.write(f"\x1b[?25l")


def set_col_offset(offset: int):
    sys.stdout.write(f"\x1b[{offset}G")


def is_ansi_key(target: bytes) -> bool:
    if target == b"\x1b":
        return True
    return False
