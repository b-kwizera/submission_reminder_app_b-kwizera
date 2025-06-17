#!/bin/bash

# Asking user for the new assignment name
read -p "Enter the new assignment name: " new_assignment

# Updating the ASSIGNMENT value in config.env
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" ./config/config.env

# Runnig startup.sh to check who hasn't submitted
bash ./scripts/startup.sh
