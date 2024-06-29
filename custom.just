# vim: set ft=make :

kmonad-setup:
	#!/usr/bin/env bash
	sudo groupadd uniput
	sudo usermod -aG input,uinput $USER
	echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' | sudo tee /etc/udev/rules.d/90-kmonad.rules
	sudo modprobe uinput
	sudo curl -Lo /etc/systemd/system/kmonad@.service https://raw.githubusercontent.com/kmonad/kmonad/master/startup/kmonad%40.service
	sudo ln -sT $HOME/.config/kmonad /etc/kmonad

	echo "Reboot for uinput rules and groups to apply"
	echo -e "To enable enable the kmonad systemd service run 'sudo systemctl enable kmonad@\033[31mconfig-name\033[m'"
