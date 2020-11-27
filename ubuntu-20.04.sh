#!/bin/bash

sudo apt update sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean
sudo apt install -y git

#TODO only if on vm, maybe detect with hardware check?
wget https://raw.githubusercontent.com/Microsoft/linux-vm-tools/master/ubuntu/18.04/install.sh
sudo chmod +x install.sh 
sudo ./install.sh 
if [ -f /etc/xrdp/xrdp.ini ]; then # if xrdp settings exit
  sudo sed -i "s/^use_vsock=true$/use_vsock=false/" /etc/xrdp/xrdp.ini
fi

mkdir -p ~/code
git clone https://github.com/tillhoff/tiny-bear.git

./software/grub2.sh
./software/vscode.sh
