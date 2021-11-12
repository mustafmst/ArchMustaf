#!/bin/bash

bash 0-preinstall.sh
arch-chroot /mnt /root/ArchMustaf/1-setup-de.sh
arch-chroot /mnt /root/ArchMustaf/2-setup-pkg.sh
/usr/bin/runuser -u $username -- /home/$username/ArchMustaf/3-user.sh
arch-chroot /mnt /root/ArchMustaf/4-postinstall.sh
exit
