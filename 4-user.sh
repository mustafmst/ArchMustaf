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

echo -e "\nINSTALLING AUR SOFTWARE\n"

echo "CLONING: YAY"
cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm
cd ~

PKGS=(
'autojump'
'awesome-terminal-fonts'
'dxvk-bin' # DXVK DirectX to Vulcan
'nerd-fonts-fira-code'
'noto-fonts-emoji'
'papirus-icon-theme'
'ocs-url' # install packages from websites
'ttf-droid'
'ttf-hack'
'ttf-meslo' # Nerdfont package
'ttf-roboto'
'snap-pac'
'pamac-aur'
'solaar'
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

rm -rf ${HOME}/ArchMustaf

mkdir -p ${HOME}/tmp-build
cd ${HOME}/tmp-build

git clone https://github.com/micheleg/dash-to-dock.git
cd ${HOME}/tmp-build/dash-to-dock
make
make install
cd ~


exit