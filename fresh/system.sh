#!/bin/bash

sudo systemctl set-default multi-user.target
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
