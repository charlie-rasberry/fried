#!/bin/bash
set -euo pipefail

echo "Enabling services"
sudo systemctl enable --now httpd
sudo systemctl enable --now sshd

echo "Services enabled"
