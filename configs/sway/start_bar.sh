#!/bin/bash
pkill -x waybar   # kill old instances
sleep 0.1         # wait for processes to fully exit
waybar &          # launch fresh

