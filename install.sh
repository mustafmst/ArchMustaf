#!/bin/bash

bash 0-preinstall.sh
arch-chroot /mnt 
cd /root/ArchMustaf
source install.conf
./1-setup-de.sh
./2-setup-pkg.sh
./3-user.sh
./4-postinstall.sh
exit
