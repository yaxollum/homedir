#!/usr/bin/env xonsh
cd /var/lib/flatpak/exports/bin
for f in `.*`:
	cp @(f) ~/.local/bin/@(f.split('.')[-1].lower())
