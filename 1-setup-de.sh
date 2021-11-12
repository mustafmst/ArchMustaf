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

echo -e "-------------------------------------------------"
echo -e "|***********************************************|"
echo -e "| INSTALLING XORG AND GNOME                     |"
echo -e "|***********************************************|"
echo -e "-------------------------------------------------"

PKGS=(
'mesa' # Essential Xorg First
'xorg'
'xorg-server'
'xorg-apps'
'xorg-drivers'
'xorg-xkill'
'xorg-xinit'
'gnome-shell'
'nautilus'
# 'gnome-terminal'
'gnome-tweak-tool'
'gnome-control-center'
'xdg-user-dirs'
'gdm'
'gedit'
'gnome-boxes'
'gnome-backgrounds'
'gnome-calculator'
'gnome-session'
'gnome-themes-extra'
'file-roller'
'epiphany'
'evince'
'baobab'
'gnome-calendar'
'gnome-shell-extentions',
'gnome-system-monitor',
'mutter'
'sushi'
# ------------------------------- extensions
'gnome-shell-extension-gtile'
'gnome-menus'
'gnome-shell-extensions'
'gnome-shell-extension-pop-shell'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo -e "\nEnabling Login Display Manager"

# ENABLE GDM to log into GNOME session
systemctl start gdm.service
systemctl enable gdm.service

# ------------------------------------------------------------------------
echo -e "\nInstall arch and AUR missing extensions"

# dash to dock

wget -O /home/$username/dash-to-dock.zip https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v71.shell-extension.zip
mkdir -p /usr/gnome-shell/extensions
unzip /home/$username/dash-to-dock.zip -d /usr/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/

