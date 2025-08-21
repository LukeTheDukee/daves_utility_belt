#!/usr/bin/env python3

import os
import argparse
import logging
from pathlib import Path
from logger_setup import setup_logging
import logger_setup


def organize_and_sort_files(directory):
    """
    Organizes and sorts files in the specified directory.
    Should be mostly platform independent. Only tested on Linux.

    Parameters:
    directory (str): The path to the directory to organize.
    """
    # Get logging setup going.

    setup_logging()

    logging.info("Starting file organization...")

    extensions = {
        "Images": [".jpg", ".jpeg", ".png", ".gif"],
        "Documents": [".pdf", ".docx", ".txt"],
        "Videos": [".mp4", ".mkv"],
        "Music": [".mp3", ".wav"],
    }

    if not os.path.exists(directory):  # Does the directory exist?
        logging.error(f"Directory {directory} does not exist.")
        return
    elif not any(Path(directory).iterdir()):  # Is the directory empty?
        logging.info(f"Directory {directory} is empty. Nothing to organize.")
        return

    # Loop to check if the directories exist in home, if not create them.
    for folder in extensions.keys():
        current_check = logger_setup.home_directory / folder
        if not current_check.exists():
            logging.error(f"Directory {current_check} does not exist. Will be created.")
            current_check.mkdir(parents=True, exist_ok=True)

    # Move files to their respective directories.

    for dir_type, extension in extensions.items():
        for ext in extension:
            items = Path(directory).glob(f"*{ext}")

            if not items:  # If list is empty, skip to next extension
                continue

            for item in items:  # Move each item to the appropriate directory
                destination = logger_setup.home_directory / dir_type / item.name
                logging.info(f"Moving {item} to {destination}")

                try:
                    item.rename(destination)
                    logging.info(f"Moved {item} to {destination}.")
                except Exception as e:
                    logging.error(f"Error moving {item} to {destination}: {e}")


if __name__ == "__main__":
    """
    Main function to parse arguments and call the organize function.

    """

    arg_parser = argparse.ArgumentParser(
        description="Organize and sort files in a directory."
    )
    arg_parser.add_argument("directory", type=str, help="The directory to organize.")
    args = arg_parser.parse_args()

    organize_and_sort_files(args.directory)
