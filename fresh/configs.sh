#!/bin/bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Get the actual user
if [ -n "${SUDO_USER:-}" ]; then
    ACTUAL_USER="$SUDO_USER"
    USER_HOME=$(eval echo ~$SUDO_USER)
else
    ACTUAL_USER="$USER"
    USER_HOME="$HOME"
fi

echo "Deploying configs from $REPO_DIR to $USER_HOME"

# Create directories
mkdir -p $USER_HOME/.config/{sway,waybar/scripts,foot,mako,fontconfig/conf.d}

# Remove old nvim symlink
rm -rf $USER_HOME/.config/nvim
mkdir -p $USER_HOME/.config/nvim

# Copy configs
cp -rf "$REPO_DIR/configs/sway/"* $USER_HOME/.config/sway/
cp -rf "$REPO_DIR/configs/waybar/"* $USER_HOME/.config/waybar/
cp -f "$REPO_DIR/configs/foot/foot.ini" $USER_HOME/.config/foot/
cp -f "$REPO_DIR/configs/mako/config" $USER_HOME/.config/mako/
cp -rf "$REPO_DIR/configs/fontconfig/conf.d/"* $USER_HOME/.config/fontconfig/conf.d/
cp -f "$REPO_DIR/configs/nvim/init.vim" $USER_HOME/.config/nvim/

# Fix ownership
chown -R $ACTUAL_USER:$ACTUAL_USER $USER_HOME/.config

# Make scripts executable
chmod +x $USER_HOME/.config/sway/*.sh
chmod +x $USER_HOME/.config/waybar/scripts/*.sh

# Install fonts
echo "Installing fonts"
mkdir -p /usr/share/fonts/bauhaus /usr/share/fonts/space-mono
unzip -oq "$REPO_DIR/fonts/bauhaus.zip" -d /usr/share/fonts/bauhaus/
unzip -oq "$REPO_DIR/fonts/Space_Mono.zip" -d /usr/share/fonts/space-mono/
fc-cache -fv

# Install background
echo "Installing background"
mkdir -p /usr/share/backgrounds/fried
cp "$REPO_DIR/backgrounds/"* /usr/share/backgrounds/fried/

echo "Configs deployed"
