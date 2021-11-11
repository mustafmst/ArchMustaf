#!/bin/bash

    bash 0-preinstall.sh
    arch-chroot /mnt /root/ArchMustaf/1-setup.sh
    source /mnt/root/ArchMustaf/install.conf
    arch-chroot /mnt /usr/bin/runuser -u $username -- /home/$username/ArchMustaf/2-user.sh
    arch-chroot /mnt /root/ArchMustaf/3-post-setup.sh
    arch-chroot /mnt /root/ArchMustaf/4-configure-gnome.sh
