# Submission Reminder App

This app helps students get reminders about pending assignments.

## How to Run

1. Run the setup:
   
   ./create_environment.sh

NB: When prompted to input a name, use: 'bodgar' so that the next scripts runs smoothly.(the next script uses a hard coded path)

2. Run the copilot script
    
    ./copilot_shell_script.sh

    N.B: If u want to test if it works rerun startup.sh which will check the non-submission status of students for the new assignment that u just saved in the config/config.en



  Expected output(if u inputed "Git")

  Assignment: Git
  Days remaining to submit: 2 days
  --------------------------------------------
  Checking submissions in ./assets/submissions.txt
  Reminder: Aime has not submitted the Git assignment!
  Reminder: Sharon has not submitted the Git assignment!
    
