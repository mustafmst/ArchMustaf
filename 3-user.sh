#!/usr/bin/env bash
#----------------------------------------------------------------------------------------------
#  ▄▄▄       ██▀███   ▄████▄   ██░ ██  ███▄ ▄███▓ █    ██   ██████ ▄▄▄█████▓ ▄▄▄        █████▒
# ▒████▄    ▓██ ▒ ██▒▒██▀ ▀█  ▓██░ ██▒▓██▒▀█▀ ██▒ ██  ▓██▒▒██    ▒ ▓  ██▒ ▓▒▒████▄    ▓██   ▒ 
# ▒██  ▀█▄  ▓██ ░▄█ ▒▒▓█    ▄ ▒██▀▀██░▓██    ▓██░▓██  ▒██░░ ▓██▄   ▒ ▓██░ ▒░▒██  ▀█▄  ▒████ ░ 
# ░██▄▄▄▄██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒░▓█ ░██ ▒██    ▒██ ▓▓█  ░██░  ▒   ██▒░ ▓██▓ ░ ░██▄▄▄▄██ ░▓█▒  ░ 
#  ▓█   ▓██▒░██▓ ▒██▒▒ ▓███▀ ░░▓█▒░██▓▒██▒   ░██▒▒▒█████▓ ▒██████▒▒  ▒██▒ ░  ▓█   ▓██▒░▒█░    
#  ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ░▒ ▒  ░ ▒ ░░▒░▒░ ▒░   ░  ░░▒▓▒ ▒ ▒ ▒ ▒▓▒ ▒ ░  ▒ ░░    ▒▒   ▓▒█░ ▒ ░    
#   ▒   ▒▒ ░  ░▒ ░ ▒░  ░  ▒    ▒ ░▒░ ░░  ░      ░░░▒░ ░ ░ ░ ░▒  ░ ░    ░      ▒   ▒▒ ░ ░      
#   ░   ▒     ░░   ░ ░         ░  ░░ ░░      ░    ░░░ ░ ░ ░  ░  ░    ░        ░   ▒    ░ ░    
#       ░  ░   ░     ░ ░       ░  ░  ░       ░      ░           ░                 ░  ░        
#                    ░                                                                        
#----------------------------------------------------------------------------------------------

echo -e "\nDone!\n"
if ! source ${HOME}/ArchMustaf/Install.conf; then
	read -p "Please enter username:" username
echo "username=$username" >> ${HOME}/ArchMustaf/install.conf
fi
if [ $(whoami) = "root"  ];
then
    useradd -m -G wheel,libvirt -s /bin/bash $username 
	passwd $username
	cp -R /root/ArchMustaf /home/$username/
    chown -R $username: /home/$username/ArchMustaf
	read -p "Please name your machine:" nameofmachine
	echo $nameofmachine > /etc/hostname
else
	echo "You are already a user proceed with aur installs"
fi

echo -e "\nINSTALLING AUR SOFTWARE\n"

echo "CLONING: YAY"
cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm
cd ~

PKGS=(
'terminator'
'autojump'
'awesome-terminal-fonts'
'dxvk-bin' # DXVK DirectX to Vulcan
'nerd-fonts-fira-code'
'noto-fonts-emoji'
'papirus-icon-theme'
'ocs-url' # install packages from websites
'sddm-nordic-theme-git'
'snapper-gui-git'
'ttf-droid'
'ttf-hack'
'ttf-meslo' # Nerdfont package
'ttf-roboto'
'snap-pac'
'pamac-aur'
'arc-gtk-theme'
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

export PATH=$PATH:~/.local/bin

echo -e "\nDone!\n"
exit