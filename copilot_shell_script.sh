#!/bin/bash

# Asking the user for the new assignment name
read -p "Enter new assignment name: " new_assignment

# Updating the ASSIGNMENT value in the config.env file inside the app folder
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" submission_reminder_bodgar/config/config.env

# Confirmation message
echo "ASSIGNMENT updated to: $new_assignment"
