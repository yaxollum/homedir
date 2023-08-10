#!/bin/bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.videolan.VLC com.discordapp.Discord us.zoom.Zoom com.spotify.Client org.mozilla.firefox
