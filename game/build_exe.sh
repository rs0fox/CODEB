#!/bin/bash

# Install PyInstaller
pip install pyinstaller

# Build executable
pyinstaller --onefile main.py

# Check if the executable was successfully created
if [ -f dist/main.exe ]; then
    echo "Executable found. Uploading to S3..."
    # Replace with your actual S3 bucket name
    aws s3 cp dist/main.exe s3://builddb/game/main.exe
    echo "Upload complete."
else
    echo "Executable not found. Please check the build process."
    exit 1
fi
