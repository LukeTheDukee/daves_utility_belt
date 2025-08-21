#!/usr/bin/env bash

"$(dirname "$0")/colors.sh" # Import color definitions from colors.sh

# Prepare logger.

if ! [[ -f $HOME/.util_log/backup.log ]]; then # Check if the log file and directory exist
  mkdir -p "$HOME/.util_log"
  touch "$HOME/.util_log/backup.log"
fi

log_file="$HOME/.util_log/backup.log"
first=$(date +"%Y-%m-%d_%H-%M-%S") # Get the current date and time

log() { # Super duper complicated logging function
  local message="$1"
  echo "$first - $message" >>"$log_file"
}

result=${PWD##*/}   # filter everything except the last part of the path
result=${result:-/} # to correct for the case where PWD is / (root)

echo -e "Preparing to back up current directory to tar archive...\n"
log "Preparing to back up current directory: $result"

found=false # Initialize found variable to false

for file in *backup*; do # Check for existing backup files
  if [ -f "$file" ]; then
    found=true
  fi
done

replace_backup_file() {

  echo -e "\nPlease choose an option:\n" # Little menu for the user

  echo -e "------------------------------"
  echo -e "| ${RED}0${NC}: Exit                       |"
  echo -e "| ${RED}1${NC}: Create new backup          |"
  echo -e "| ${RED}2${NC}: Replace oldest backup      |"
  echo -e "| ${RED}3${NC}: Replace most recent backup |"
  echo -e "------------------------------"

  read -r response

  case "$response" in
  0)
    echo "Goodbye!"
    exit 0
    ;;

  1)
    echo "Creating a new backup..." # Just create a new addtional backup file
    tar -czvf "backup.$first.$result.tar.gz" ./*
    echo -e "\nBackup completed successfully. Archive created: backup.$first.$result.tar.gz"
    log "Created new backup: backup.$first.$result.tar.gz"
    ;;
  2)
    echo "Replacing existing backup file..."                                                               # Replace the oldest backup file
    backup_file=$(find . -name '*backup*' -type f -printf '%T@ %p\n' | sort -n | head -1 | cut -d' ' -f2-) # Get the oldest backup file
    /bin/rm -fv "$backup_file"
    echo -e "\nOldest backup file removed. Creating new backup..."
    tar -czvf "backup.$first.$result.tar.gz" ./*
    echo -e "\nBackup completed successfully. Archive created: backup.$first.$result.tar.gz"
    log "Replaced oldest backup: $backup_file with backup.$first.$result.tar.gz"
    ;;
  3)
    echo "Replacing most recent backup file..."                                                            # Replace the most recent backup file
    backup_file=$(find . -name '*backup*' -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -d' ' -f2-) # Get the most recent backup file
    /bin/rm -fv "$backup_file"
    echo -e "\nMost recent backup file removed. Creating new backup..."
    tar -czvf "backup.$first.$result.tar.gz" ./*
    echo -e "\nBackup completed successfully. Archive created: backup.$first.$result.tar.gz"
    log "Replaced most recent backup: $backup_file with backup.$first.$result.tar.gz"
    ;;
  *)
    echo -e "\nInvalid option. Please try again." # Invalid option handling, recursive call to the function
    log "Invalid option selected: $response"
    replace_backup_file
    ;;
  esac
}

# Main logic to check for existing backup files

if [ "$found" = true ]; then
  echo -e "Error: There is already a backup file present in the current directory.\n"
  log "Error: Existing backup file found in the current directory."
  replace_backup_file
else # Proceed with backup if no existing backup file is found
  echo -e "No existing backup file found, proceeding with backup...\n"
  tar -czvf "backup.$first.$result.tar.gz" ./*
  log "Backup successfully completed. Created backup: backup.$first.$result.tar.gz"
  echo -e "\nBackup completed successfully. Archive created: backup.$first.$result.tar.gz"
fi
