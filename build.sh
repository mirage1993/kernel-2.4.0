#!/bin/sh

make menuconfig

if [ ! -f /boot/grub/grub.conf.bak ]; then
	sudo cp /boot/grub/grub.conf /boot/grub/grub.conf.bak
fi

sudo cp -f /boot/grub/grub.conf.bak /boot/grub/grub.conf
make dep
make bzImage -j4
sudo make modules_install
sudo make install
