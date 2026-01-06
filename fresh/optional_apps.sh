#!/bin/bash
set -euo pipefail

echo "Installing applications"
sudo dnf install -y \
	firefox \
	audacious \
	btop
	
echo "Applications installed"
