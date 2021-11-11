# ------------------------------------------------------------------------

echo -e "\n------------------------------------------------------------------------"
echo -e "\t\t\t\t INSTALLING AND CONFIGURING GNOME DE"
echo -e "\n------------------------------------------------------------------------"

echo -e "\nInstalling GNOME essential packages"

PKGS=(
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
# extensions
'gnome-shell-extension-gtile'
'gnome-menus'
'gnome-shell-extensions'
'gnome-shell-extension-pop-shell'
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

echo -e "\nEnabling Login Display Manager"
# systemctl enable sddm.service
# echo -e "\nSetup SDDM Theme"
# cat <<EOF > /etc/sddm.conf
# [Theme]
# Current=Nordic
# EOF

# ENABLE GDM to log into GNOME session
systemctl start gdm.service
systemctl enable gdm.service

# ------------------------------------------------------------------------
echo -e "\nInstall arch and AUR missing extensions"

source install.conf

# dash to dock

wget -O /home/$username/dash-to-dock.zip https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v71.shell-extension.zip
mkdir -p /usr/gnome-shell/extensions
unzip /home/$username/dash-to-dock.zip -d /usr/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/


# echo -e "\nEnabling GNOME shell extensions"

# gnome-extensions enable gravatar@jr.rlabs.io
# gnome-extensions enable gsconnect@andyholmes.github.io
# gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
# gnome-extensions enable sound-output-device-chooser@kgshank.net
# gnome-extensions enable dash-to-dock@micxgx.gmail.com
# gnome-extensions enable drive-menu@gnome-shell-extensions.gcampax.github.com
# gnome-extensions enable pamac-updates@manjaro.org
# gnome-extensions enable places-menu@gnome-shell-extensions.gcampax.github.com
# gnome-extensions enable pop-shell@system76.com
# gnome-extensions enable workspace-indicator@gnome-shell-extensions.gcampax.github.com

echo -e "\nCopy and set background image"

mkdir -p /usr/share/backgrounds
mv ~/ArchMustaf/data/backgrounds/* /usr/share/backgrounds
mkdir -p /usr/share/gnome-background-properties/
mv ~/ArchMustaf/data/background-settings/* /usr/share/gnome-background-properties
# gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/arch-1.jpg
# gsettings set 

mkdir -p /etc/dconf/profile
echo -e "\nUser dconf profile"
cat <<EOF > /etc/dconf/profile/$username
user-db:$username
system-db:local
EOF
mkdir -p /ectdconf/db/local.d
cat <<EOF > /etc/dconf/db/local.d/00-background
# Specify the dconf path
[org/gnome/desktop/background]

# Specify the path to the desktop background image file
picture-uri='file:///usr/local/share/backgrounds/arch-1.jpg'

# Specify one of the rendering options for the background image:
picture-options='centered'
# Specify the left or top color when drawing gradients, or the solid color
primary-color='000000'

# Specify the right or bottom color when drawing gradients
secondary-color='000000'
EOF
