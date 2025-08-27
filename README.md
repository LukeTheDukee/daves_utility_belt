# Dave's Utility Belt
A couple of small utility scripts for a CLI based workflow.

The Utility Belt is a compilation of several scripts, with the capability to backup, organize and create files and folders. Additionally there are a couple of small goodies like a weather script. All scripts are specifically for the use with a shell.

## Backup Script

This Bash script automates the process of creating and managing backups of the current directory. It allows users to create new backups or replace existing ones, based on their preferences. The script also includes logging functionality to track backup operations.

### Features

- **Backup Creation**: Create a new backup of the current directory.
- **Backup Management**: Options to replace the oldest or most recent backup if one already exists
- **Logging**: Logs all backup operations to a specified log file for tracking purposes.
- **User-Friendly Interface**: Interactive menu for selecting backup options.

### Structure

The script first checks and if necessary creates a backup directory at `$HOME/.backups`, to store all backup files and a log directory at `$HOME/.util_log` for logging purposes.

### Requirements

- Bash Shell
- tar

## Colors

Modular script to reuse colors among all bash scripts. Enhances user expierence among all outputs of the bash scripts.

### Colors

- Red
- Light Blue
- LIght Gray
- Drak Gray

## Logger Setup

The logger setup script provides a standardized logging configuration for utility scripts. It creates a dedicated log directory and log file to record events, making it easier to track the execution and any issues that may arise.

### Features

- **Centralized Logging**: All logs are stored in a single location, making it easy to review and manage log files.

- **Customizable Log Format**: The logging format includes timestamps, log levels, and messages for better traceability.
- **Automatic Directory Creation**: The script automatically creates the necessary directories if they do not exist.

### Usage

To use the logger setup in your scripts, simply import the `logger_setup` module and call the `setup_logging()` function at the beginning of your script.

### Structure

Logs are stored in the user's home directory under `.util_log/file_org.log`. You can change the log file path by modifying the `home_log_path` variable in the `logger_setup.py` script.













