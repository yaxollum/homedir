#!/usr/bin/env xonsh
cd /var/lib/flatpak/exports/bin
for f in `.*`:
	ln -s @(f) @(f.split('.')[-1].lower())
