#!/usr/bin/env python3

import os

"""
A script to setup several directory structures for different types of
development projects, including springboot, golang, python, nodejs, and
bash projects.
"""


# Setup project name and create the main project directory
def project_name_setup():
    project_name = input("Enter the project name: ")
    if not project_name:
        print("Project name cannot be empty.")
        return

    if os.path.exists(project_name):
        print(f"Directory '{project_name}' already exists.")
        return

    os.makedirs(project_name)
    os.chdir(project_name)


def create_file_folders(folders, files):
    # Create the directory structure
    for folder in folders:
        os.makedirs(folder, exist_ok=True)

    # Create the files
    for file_path, content in files:
        with open(file_path, "w") as f:
            f.write(content)


"""
A simple function to setup a springboot directory structure for a
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


def setup_springboot_structure():
    project_name_setup()

    # Define the folders to create
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

    # Create the file and folder structure
    create_file_folders(folders, files)

    print("\nSpringboot project structure created successfully.")


"""
A simple function to setup a golang directory structure for a
development project. It creates the following structure:

project/
    cmd/
        myapp/
            main.go
    pkg/
    internal/
    api/
    configs/
    scripts/
    tests/
    go.mod
    README.md
"""


def setup_go_structure():
    project_name_setup()

    folders = ["cmd/myapp", "pkg", "internal", "api", "configs", "scripts", "tests"]

    files = [
        (
            "cmd/myapp/main.go",
            "package main\n\nfunc main() {\n    // TODO: Implement main function\n}\n",
        ),
        ("go.mod", "module\n"),
        ("README.md", "# README.md\n"),
    ]

    # Create the file and folder structure
    create_file_folders(folders, files)

    print("\nGolang project structure created successfully.")


"""
A simple function to setup a python directory structure for a
development project. It creates the following structure:

project/
    my_app/
        __init__.py
        main.py
    tests/
        __init__.py
    requirements.txt
    setup.py
    README.md
"""


def setup_python_structure():
    project_name_setup()

    folders = [
        "my_app",
        "tests",
    ]

    files = [
        ("my_app/__init__.py", "# __init__.py\n"),
        ("my_app/main.py", "# main.py\n"),
        ("tests/__init__.py", "# __init__.py\n"),
        ("requirements.txt", "# requirements.txt\n"),
        ("setup.py", "# setup.py\n"),
        (R"EADME.md", "# README.md\n"),
    ]

    create_file_folders(folders, files)
