#!/bin/bash

echo "Installing some base packages"

sudo dnf -y upgrade

sudo dnf -y install git\
	neovim\
	fastfetch\
	wget\
	tmux\
	curl\
	htop\
	ripgrep\
	xclip\
	fd-find\
	man-db\
	tree\
	ranger\
	unzip\
	7z\
	g++\
	httpd\
	openssh-server\
	vim-enhanced\
	

echo "Base packages done"

