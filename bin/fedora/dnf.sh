#!/bin/bash
dnf install flatpak lightdm gvim alacritty i3 google-noto-serif-cjk-ttc-fonts dejavu-sans-mono-fonts

dnf groupinstall "Development Tools"

dnf install fcitx5 fcitx5-hangul fcitx5-rime
