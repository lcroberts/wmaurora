#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages
# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# Add copr repos
curl -Lo /etc/yum.repos.d/_copr_solopasha-hypr.repo https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-"${RELEASE}"/solopasha-hyprland-fedora-"${RELEASE}".repo
curl -Lo /etc/yum.repos.d/_copr_wezfurlong-wezterm.repo https://copr.fedorainfracloud.org/coprs/wezfurlong/wezterm-nightly/repo/fedora-"${RELEASE}"/wezfurlong-wezterm-nightly-fedora-"${RELEASE}".repo

# this installs a package from fedora repos
rpm-ostree --idempotent install \
	adobe-source-han-sans-jp-fonts \
	adobe-source-han-serif-jp-fonts \
	mozilla-fira-mono-fonts \
	powerline-fonts \
	jetbrains-mono-fonts-all \
	google-droid-sans-mono-fonts \
	rofi-wayland \
	kvantum \
	kvantum-qt5 \
	qt6ct \
	qt5ct \
	onedrive \
	zathura \
	zathura-pdf-mupdf \
	zathura-djvu \
	zathura-ps \
	zathura-cb \
	fcitx5 \
	fcitx5-configtool \
	fcitx5-gtk \
	fcitx5-qt5 \
	fcitx5-mozc \
	neovim \
	eza \
	ripgrep \
	zoxide \
	tmux \
	iotop \
	wezterm \
	btop \
	direnv \
	stow

# Hyprland Stuff
rpm-ostree --idempotent install \
	hyprland \
	hyprland-contrib \
	hyprpicker \
	hyprlock \
	hypridle \
	swww \
	aylurs-gtk-shell \
	fd-find \
	polkit-gnome \
	network-manager-applet \
	wl-clipboard \
	brightnessctl \
	playerctl \
	kanshi \
	pavucontrol \
	kitty # For until wezterm wayland stuff is fixed

# Example for enabling a System Unit File
systemctl enable podman.socket
sudo systemctl disable tailscaled.service

curl -Lo /usr/bin/kmonad https://github.com/kmonad/kmonad/releases/latest/download/kmonad
chmod +x /usr/bin/kmonad
curl -Lo /usr/share/ublue-os/just/60-custom.just https://raw.githubusercontent.com/lcroberts/wmaurora/main/custom.just
