#!/usr/bin/env python3

import os

"""
A simple script to setup a springboot directory structure for a
development project. It creates the following structure:

project/
    src/
        main/
            java/
                com/
            resources/
                application.yml
                static/
                templates/
        test/
            java/
                com/
            resources/
    docs/
        README.md
    config/
        config.json
    pom.xml
"""

folders = [
    "src/main/java/com",
    "src/main/resources/static",
    "src/main/resources/templates",
    "src/test/java/com",
    "src/test/resources",
    "docs",
    "config",
]

# Define the files to create
files = [
    ("src/main/resources/application.yml", "# application.yml\n"),
    ("docs/README.md", "# README.md\n"),
    ("config/config.json", "{}\n"),
    ("pom.xml", "<project></project>\n"),
]

# Create the directory structure
for folder in folders:
    os.makedirs(folder, exist_ok=True)

# Create the files
for file_path, content in files:
    with open(file_path, "w") as f:
        f.write(content)

print("\nSpringboot project structure created successfully.")
