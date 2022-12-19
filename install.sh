#!/bin/bash

# Stocking some informations
username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
sudo apt update
sudo apt upgrade -y

# Install nala
sudo apt install nala -y
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
sudo nala install xterm kitty thunar picom vim git neofetch rofi firefox-esr arandr zip unzip flameshot feh dunst -y

# Installing some fonts
unzip fantasque-sans-mono.zip -d fantasque-sans-mono
sudo cp -Rv fantasque-sans-mono /usr/share/fonts
cp -Rv fantasque-sans-mono /home/$username/.local/share/fonts
fc-cache -f -v

# Setting up wallpapers
mkdir -pv /home/$username/Pictures
cp -Rv wallpapers /home/$username/Pictures/

# Sound stuff
sudo nala install pulseaudio pavumeter pavucontrol paprefs avahi-daemon
sudo nala install breeze-icon-theme

# Installing cursor theme
sudo cp -Rv Sweet-dark /usr/share/icons/