#!/bin/bash

echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf

cat > /etc/lightdm/lightdm.conf <<EOF
[Seat:*]
autologin-user=yaxollum
user-session=i3
EOF

cat > /etc/udev/rules.d/90-usb-wakeup.rules <<EOF
# Disable waking up from Logitech unified receiver
ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c52b", ATTR{power/wakeup}="disabled"
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

cat > /etc/dnsmasq.conf <<EOF
clear-on-reload

address=/lichess.org/
address=/chess.com/

# Google
server=8.8.8.8
server=8.8.4.4
server=2001:4860:4860::8888
server=2001:4860:4860::8844

# uwaterloo
server=129.97.2.1
server=129.97.2.2
EOF

if ! grep -q "Samba" /etc/fstab; then
cat >> /etc/fstab <<EOF
# Samba shares
//192.168.0.121/_shared /srv/smb/s1 cifs guest,vers=1.0,noauto,x-systemd.automount 0 0
//192.168.0.121/Volume_2 /srv/smb/s2 cifs guest,vers=1.0,noauto,x-systemd.automount 0 0
EOF
fi
