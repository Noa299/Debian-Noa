#!/bin/bash

# Stocking some informations
username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
sudo apt update
sudo apt upgrade -y

# Installing Nala and its dependencies
sudo wget -qO- https://deb.volian.org/volian/scar.key | gpg --dearmor | dd of=/usr/share/keyrings/volian-archive-scar.gpg
sudo echo "deb [signed-by=/usr/share/keyrings/volian-archive-scar.gpg arch=amd64] https://deb.volian.org/volian/ scar main" > /etc/apt/sources.list.d/volian-archive-scar.list
sudo apt update
sudo apt install nala-legacy -y
sudo nala fetch

# Installing qtile and its dependencies
sudo nala install xserver-xorg xinit libpangocairo-1.0-0 python3-pip python3-xcffib python3-cairocffi -y

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
export PATH

pip install qtile
pip install psutil mypy

# Setting up the login manager
sudo nala install sddm -y
sudo systemctl enable sddm
sudo systemctl set-default graphical.target

# Adding a desktop entry for qtile
sudo mkdir -v /usr/share/xsessions
sudo cp -v qtile.desktop /usr/share/xsessions/qtile.desktop

# Installing basic programs
sudo nala install xterm kitty thunar dolphin picom vim git neofetch rofi firefox-esr arandr zip unzip flameshot feh dunst -y

# Installing some fonts
wget https://www.1001fonts.com/download/fantasque-sans-mono.zip
unzip fantasque-sans-mono.zip -d fantasque-sans-mono
sudo cp -Rv fantasque-sans-mono /usr/share/fonts
cp -Rv fantasque-sans-mono /home/$username/.local/share/fonts
fc-cache -f -v

# Setting up wallpapers
mkdir -pv /home/$username/Pictures
cp -Rv wallpapers /home/$username/Pictures/

# Sound stuff
sudo nala install pulseaudio pavumeter pavucontrol paprefs avahi-daemon pasystray -y
sudo nala install breeze-icon-theme -y

# Installing cursor theme
tar -jxvf Sweet-cursors.tar.bz2
sudo cp -Rv Sweet-cursors /usr/share/icons/

# Copying config files
mkdir -pv /home/$username/.config
cp -Rv dotconfig/* /home/$username/.config/
sudo chmod +x /home/$username/.config/qtile/autostart.sh
mkdir -pv /home/$username/.screenlayout
cp screenlayout/def.sh /home/$username/.screenlayout/
sudo chmod +x /home/$username/.screenlayout/def.sh
