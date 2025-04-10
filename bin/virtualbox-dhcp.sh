#!/bin/bash

# Configuration is located in ~/.config/VirtualBox/HostInterfaceNetworking-vboxnet0-Dhcpd.config
# May need to delete existing leases in the .leases file in the same directory as config
# Need to restart the VirtualBox dhcp server to update config

VBoxManage dhcpserver modify --interface=vboxnet0 --mac-address=<enter mac addr here> --fixed-address=192.168.56.123
