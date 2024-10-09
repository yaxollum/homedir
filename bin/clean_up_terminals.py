#!/usr/bin/env python3

import psutil

for p in psutil.process_iter():
    if (
        p.name() == "xonsh"
        and p.parent().name() == "alacritty"
        and len(p.children()) == 0
    ):
        p.terminate()
