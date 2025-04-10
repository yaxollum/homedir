#!/bin/bash
VBoxManage dhcpserver modify --interface=vboxnet0 --vm=arch --fixed-address=192.168.56.3
