# Debian-Noa
A configuration for my minimal qtile desktop, on a Debian base.

# Updating the kernel
```
sudo vim /etc/apt/sources.list
- Add this line: "deb http://deb.debian.org/debian bullseye-backports main"
sudo apt update
sudo apt install -t bullseye-backports linux-image-amd64
sudo reboot
```

# Installation 
```
git clone https://github.com/Noa299/Debian-Noa
cd Debian-Noa/
chmod +x install.sh
./install.sh
```
