#!/usr/bin/env python3

import sys

from selman import Selman
import assets


def setcursor(row, col):
    sys.stdout.write(f"\x1b[{row};{col}H")
    sys.stdout.flush()


def mainflow():
    sel = Selman(
        assets.install_options_list,
        5,
        allow_multiple_selection=True,
        mutex_group=assets.install_options_mutex,
    )
    sel.run()

    print("you selected: ")
    for i in sel.sel_board:
        if sel.sel_board[i]:
            print(i)
