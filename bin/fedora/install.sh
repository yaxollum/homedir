#!/bin/bash

./dnf.sh
systemctl enable docker

useradd yaxollum -G wheel,docker
systemctl set-default graphical.target     

echo 'PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/var/lib/flatpak/exports/bin"' > /etc/environment

cat > /etc/lightdm/lightdm.conf <<EOF
[Seat:*]
autologin-user=yaxollum
EOF

cat > /etc/samba/smb.conf <<EOF
[global]
    client min protocol = NT1
  server min protocol = SMB2_02
[phone]
  path = /home/yaxollum/Videos/phone_vids
  writable = yes
read only = no
EOF

if ! grep -q "Samba" /etc/fstab; then
cat >> /etc/fstab <<EOF
# Samba shares
//192.168.0.121/_shared /srv/smb/s1 cifs guest,vers=1.0,noauto,x-systemd.automount 0 0
//192.168.0.121/Volume_2 /srv/smb/s2 cifs guest,vers=1.0,noauto,x-systemd.automount 0 0
EOF
fi

cat > /usr/share/xsessions/qtile.desktop <<EOF
[Desktop Entry]
Name=Qtile
Comment=Qtile Session
Exec=qtile start
Type=Application
Keywords=wm;tiling
EOF

./install_xonsh.sh

./flatpak.sh
