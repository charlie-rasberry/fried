#!/bin/bash
set -euo pipefail

echo "Installing wayland and stack"
sudo dnf install -y \
	sway \
	waybar \
	foot \
	wofi \
	grim \
	slurp \
	wl-clipboard \
	xorg-x11-server-Xwayland \
	mako \
	fontconfig

echo "Getting fonts"
sudo dnf install -y jetbrains-mono-fonts
fc-cache -rv

# Comment out the bar in system sway config
sudo sed -i '/^bar {/,/^}/ s/^/#/' /etc/sway/config
