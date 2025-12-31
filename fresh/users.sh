#!/bin/bash

set -euo pipefail

mkdir -p ~/.config
mkdir -p ~/setup/configs/bash
mkdir -p ~/setup/configs/nvim

# BASH SETTINGS

cat > ~/setup/configs/bash/.bashrc << 'EOF'
export EDITOR=nvim
export TERMINAL=foot
alias ll='ls -lah'
EOF

ln -sf ~/setup/configs/bash/.bashrc ~/.bashrc

# NEOVIM

cat > ~/setup/configs/nvim/init.vim << 'EOF'
set number
syntax on
EOF

ln -sf ~/setup/configs/nvim/init.vim ~/.config/nvim

echo "User environment changes successful"
