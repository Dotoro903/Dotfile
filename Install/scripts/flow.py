#!/usr/bin/env python3

import sys
import termios
import tty

import printer

def setcursor(row, col):
    sys.stdout.write(f'\x1b[{row};{col}H')
    sys.stdout.flush()

def mainflow():
    print(printer.install_options)

    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    try:
        tty.setraw(fd)
        tty.setcbreak(fd)


        sys.stdout.write('\x1b[0G')
        sys.stdout.flush()
        sys.stdout.write('\x1b[5A')
        sys.stdout.flush()

        k = sys.stdin.read(1)
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)

    print(k)
