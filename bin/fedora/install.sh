#!/bin/bash

useradd yaxollum -G wheel
systemctl set-default graphical.target     
./dnf.sh

echo 'PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/var/lib/flatpak/exports/bin"' > /etc/environment

cat > /etc/lightdm/lightdm.conf <<EOF
[Seat:*]
autologin-user=yaxollum
EOF

cat > /etc/samba/smb.conf <<EOF
[global]
    client min protocol = NT1
EOF

if ! grep -q "Samba" /etc/fstab; then
cat >> /etc/fstab <<EOF
# Samba shares
//192.168.0.121/_shared /srv/smb/s1 cifs guest,vers=1.0,noauto,x-systemd.automount 0 0
//192.168.0.121/Volume_2 /srv/smb/s2 cifs guest,vers=1.0,noauto,x-systemd.automount 0 0
EOF
fi

./install_xonsh.sh

./flatpak.sh
