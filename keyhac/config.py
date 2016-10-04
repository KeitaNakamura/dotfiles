import sys
import os
import datetime
import subprocess

from keyhac import *


def configure(keymap):
    # call object of applications
    keymap_global = keymap.defineWindowKeymap()
    keymap_terminal = keymap.defineWindowKeymap( app_name="com.apple.Terminal" )
    keymap_iterm2 = keymap.defineWindowKeymap( app_name="com.googlecode.iterm2" )

    # global
    keymap_global["O-LCmd"] = "Ctrl-Shift-Semicolon"
    keymap_global["O-RCmd"] = "Ctrl-Shift-J"

    # terminal & iterm2
    keymap_terminal["Esc"] = "Esc", "Ctrl-Shift-Semicolon"
    keymap_iterm2["Esc"] = "Esc", "Ctrl-Shift-Semicolon"
