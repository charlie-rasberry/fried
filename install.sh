#!/bin/bash

-set -euxo pipefail

echo "Installing, one moment."

for script in base.sh system.sh packages.sh users.sh rice.sh; do
	echo "Running $script"
	./$(basename "$script")
done

echo "Completed, bootstrap successful"

