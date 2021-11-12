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

echo -e "\nCopy and set background image"

mkdir -p /usr/share/backgrounds
mv ~/ArchMustaf/data/backgrounds/* /usr/share/backgrounds
mkdir -p /usr/share/gnome-background-properties/
mv ~/ArchMustaf/data/background-settings/* /usr/share/gnome-background-properties


# Create user configuration
echo -e "\nUser dconf profile"
mkdir -p /etc/dconf/profile
touch /etc/dconf/profile/gdm
cat <<EOF > /etc/dconf/profile/gdm
user-db:user
system-db:gdm
system-db:system
file-db:/usr/share/gdm/greeter-dconf-defaults
EOF

echo -e "\nUser dconf profile"
mkdir -p /etc/dconf/profile
touch /etc/dconf/profile/user
cat <<EOF > /etc/dconf/profile/user
user-db:user
system-db:system
EOF

echo -e "\nCreating config file"
mkdir -p /etc/dconf/db/system.d
touch /etc/dconf/db/system.d/00-basic
cat <<EOF > /etc/dconf/db/system.d/00-basic
[org/gnome/desktop/background]
picture-uri='file:///usr/share/backgrounds/m-6.jpg'
picture-options='zoom'

[org/gnome/desktop/interface]
font-name='Hack 11'
document-font-name='Hack 11'
monospace-font-name='FiraCode Nerd Font weight=450 10'
gtk-theme='Materia-dark-compact'
icon-theme='Papirus-Dark'
cursor-theme='Breeze_Snow'

[org/gnome/desktop/wm/preferences]
titlebar-font='Hack Bold 11'

[org/gnome/shell]
enabled-extensions=['user-theme@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com', 'pamac-updates@manjaro.org', 'pop-shell@system76.com']

[org/gnome/shell/extensions/user-theme]
name='Materia-dark-compact'

[org/gnome/shell/extensions/dash-to-dock]
apply-custom-theme=false
background-color='rgb(0,0,0)'
background-opacity=0.6
custom-background-color=true
dash-max-icon-size=32
dock-fixed=true
dock-position='BOTTOM'
multi-monitor=true
EOF

echo -e "\nCreating config file"
mkdir -p /etc/dconf/db/gdm.d
touch /etc/dconf/db/gdm.d/00-basic
cat <<EOF > /etc/dconf/db/gdm.d/00-basic
[org.gnome.desktop.screensaver]
picture-uri='file:///usr/share/backgrounds/m-4.jpg'
picture-options='zoom'
EOF


echo -e "\n\nUpdating dconf"
dconf update
