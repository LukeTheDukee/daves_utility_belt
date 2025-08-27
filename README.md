# Dave's Utility Belt
A couple of small utility scripts for a CLI based workflow.

The Utility Belt is a compilation of several scripts, with the capability to backup, organize and create files and folders. Additionally there are a couple of small goodies like a weather script. All scripts are specifically for the use with Bash.

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

## Colors Script

Modular script to reuse colors among all bash scripts. Enhances user expierence among all outputs of the bash scripts.

### Requirements

A terminal emulator which is able to display colors. (e. g. Kitty)

## Logger Setup Script

The logger setup script provides a standardized logging configuration for utility scripts. It creates a dedicated log directory and log file to record events, making it easier to track the execution and any issues that may arise.

### Features

- **Centralized Logging**: All logs are stored in a single location, making it easy to review and manage log files.

- **Customizable Log Format**: The logging format includes timestamps, log levels, and messages for better traceability.
- **Automatic Directory Creation**: The script automatically creates the necessary directories if they do not exist.

### Usage

To use the logger setup in your scripts, simply import the `logger_setup` module and call the `setup_logging()` function at the beginning of your script.

### Structure

Logs are stored in the user's home directory under `.util_log/file_org.log`. You can change the log file path by modifying the `home_log_path` variable in the `logger_setup.py` script.

## Project Setup Script

This script automates the creation of project directory structures for various programming languages, including Spring Boot (Java), Go, and Python. It sets up a standardized layout that is commonly used in development projects, making it easier to get started with new applications.

### Features

- **Spring Boot**: Creates a directory structure suitable for Java Spring Boot applications.
- **Go**: Sets up a standard Go project layout.
- **Python**: Initializes a Python project with a typical structure.

### Requirements

- Python 3.x
- Required permissions to create directories and files in the specified location.

## File Organizer Script

This Python script organizes and sorts files in a specified directory based on their file types. It categorizes files into predefined folders such as Images, Documents, Videos, and Music, making it easier to manage and locate files.

### Features

- Automatically organizes files into designated folders based on file extensions.
- Supports common file types for images, documents, videos, and music.
- Platform-independent, tested primarily on Linux.

### Directory Structure

The script organizes files into the following directory structure within the user's `home`directory:\

`Images `

`Documents`

`Videos`

`Music`

 If the directories do not exist there will be created within the `home` directory of the user. File types can be easily extended.

### Supported File Types

-  **Images**: `.jpg`, `.jpeg`, `.png`, `.gif`
- **Documents**: `.pdf`, `.docx`, `.txt`
- **Videos**: `.mp4`, `.mkv`
- **Music**: `.mp3`, `.wav`

### Requirements

- Python 3.x
- Required permissions to create directories and files in the specified location.

## Weather Information Script

This script retrieves and displays current weather data for a specified city using the OpenWeatherMap API. Users can input the city name and country code to get real-time weather information.

### Features

- Fetches weather data from the OpenWeatherMap API
- Displays city name, temperature, humidity, and weather description
- Reads the API key from a configuration file for secure access

### Requirements

- Python 3.x
- `requests` library (install via `pip install requests`)
- An OpenWeatherMap API key (sign up at [OpenWeatherMap](https://openweathermap.org/) to get your API key).















