#!/bin/bash
set -euxo pipefail

echo "Installing, one moment."
for script in base.sh system.sh optional_apps.sh users.sh rice.sh configs.sh; do
	echo "Running $script"
	./"$script"
done
echo "Completed, bootstrap successful"
