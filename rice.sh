#!/bin/bash

set -euo

echo "Getting fonts"
sudo dnf install -y \
	jetbrains-mono-fonts\
	fontconfig

fc-cache -rv
