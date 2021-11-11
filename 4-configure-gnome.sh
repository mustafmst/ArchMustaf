# ------------------------------------------------------------------------

echo -e "\n------------------------------------------------------------------------"
echo -e "\t\t\t\t INSTALLING AND CONFIGURING GNOME DE"
echo -e "\n------------------------------------------------------------------------"

echo -e "\nInstalling GNOME essential packages"

PKGS=(
'gnome-shell'
'nautilus'
'gnome-terminal'
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