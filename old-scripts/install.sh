#!/bin/bash

    bash 0-preinstall.sh
    arch-chroot /mnt /root/ArchMustaf/1-setup.sh
    arch-chroot /mnt
    source /root/ArchMustaf/install.conf
    /usr/bin/runuser -u $username -- /home/$username/ArchMustaf/2-user.sh
    /mnt /root/ArchMustaf/3-post-setup.sh
    /mnt /root/ArchMustaf/4-configure-gnome.sh
    exit
