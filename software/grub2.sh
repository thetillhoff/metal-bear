#!/bin/bash

sudo sed -i "s/^GRUB_TIMEOUT=*$/GRUB_TIMEOUT=0/" /etc/default/grub

# There is a bug in GRUB2 which forces a grub timeout of 30 seconds on efi systems. The following disables this.
sudo sed -i "/recordfail_broken=/{s/1/0/}" /etc/grub.d/00_header
sudo update-grub
