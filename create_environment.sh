#!/bin/bash

# Asking user for their name
read -p "Enter your name: " name

# Creating root folder using their name
root_dir="submission_reminder_${name}"
mkdir -p "$root_dir"

# Creating subdirectories
mkdir -p "$root_dir"/{assets,config,modules,scripts}

# Creating image.png file 
touch "$root_dir/image.png"

# Creating and populating config.env
cat > "$root_dir/config/config.env" << EOF
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Creating and populating functions.sh
cat > "$root_dir/modules/functions.sh" << 'EOF'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file")
}
EOF

# Creating and populating reminder.sh
cat > "$root_dir/scripts/reminder.sh" << 'EOF'
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

submissions_file="./assets/submissions.txt"

echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOF

# Creating and populating submissions.txt with 9 students
cat > "$root_dir/assets/submissions.txt" << EOF
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Bodgar, Shell Navigation, not submitted
Aime, Git, not submitted
Grace, Shell Basics, submitted
Jean, Shell Navigation, submitted
Kwizera, Shell Navigation, not submitted
Sharon, Git, not submitted
EOF

# Creating and populating startup.sh 
cat > "$root_dir/scripts/startup.sh" << 'EOF'
#!/bin/bash
bash ./scripts/reminder.sh
EOF

# Making all .sh files executable
find "$root_dir" -name "*.sh" -exec chmod +x {} \;

# Final message
echo "Environment created in: $root_dir"
