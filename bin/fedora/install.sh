#!/bin/bash

useradd yaxollum -G wheel
systemctl set-default graphical.target     

dnf update
dnf install flatpak lightdm xmonad vim alacritty firefox htop

echo 'PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/var/lib/flatpak/exports/bin"' > /etc/environment

cat > /etc/lightdm/lightdm.conf <<EOF
[Seat:*]
autologin-user=yaxollum
EOF

XONSH_LOCATION="/home/yaxollum/dev/xonsh"
pip install -e $XONSH_LOCATION
pip install prompt-toolkit
chsh --shell /usr/local/bin/xonsh yaxollum

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.videolan.VLC com.discordapp.Discord us.zoom.Zoom

xonsh ./flatpak_links.xsh

dnf install google-noto-serif-cjk-ttc-fonts ibus ibus-rime

