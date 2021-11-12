#!/bin/bash

if ! source install.conf; then
    cp install.example.config install.config
fi

bash 0-preinstall.sh
arch-chroot /mnt /root/ArchMustaf/1-setup-de.sh
arch-chroot /mnt /root/ArchMustaf/2-setup-pkg.sh
arch-chroot /mnt /root/ArchMustaf/3-create-user.sh
arch-chroot /mnt /root/ArchMustaf/4-user.sh
arch-chroot /mnt /root/ArchMustaf/5-postinstall.sh
exit
