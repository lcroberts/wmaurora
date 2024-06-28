# vim: set ft=make :

kmonad-setup:
	#!/usr/bin/env bash
	sudo groupadd uniput
	sudo usermod -aG input,uinput $USER
	echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' | sudo tee /etc/udev/rules.d/90-kmonad.rules
	sudo modprobe uinput
	mkdir -p $HOME/.config/systemd/user
	curl -Lo $HOME/.config/systemd/user/kmonad@.service https://raw.githubusercontent.com/kmonad/kmonad/master/startup/kmonad%40.service
	echo "Reboot for uinput rules and groups to apply"
	echo "To enable enable the kmonad systemd sercie run 'systemctl --user enable kmonad'"
