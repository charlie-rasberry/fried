#!/bin/bash

set -euo pipefail

echo "Installing wayland and stack"

sudo dnf install -y \
	sway\
	waybar\
	foot\
	wofi\
	grim\
	slurp\
	wl-clipboard\
	xorg-x11-server-Xwayland
