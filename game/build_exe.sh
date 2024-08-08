#!/bin/bash

# Install PyInstaller
pip install pyinstaller

# Build executable
if ! pyinstaller --onefile main.py; then
    echo "PyInstaller failed. Please check the build process."
    exit 1
fi

# Check if the executable was successfully created
if [ -f dist/main.exe ]; then
    echo "Executable found. Uploading to S3..."
    # Upload to S3
    if ! aws s3 cp dist/main.exe s3://builddb/game/main.exe; then
        echo "Failed to upload to S3. Please check your AWS configuration."
        exit 1
    fi
    echo "Upload complete."
else
    echo "Executable not found. Please check the build process."
    exit 1
fi
