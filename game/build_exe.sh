#!/bin/bash

# Exit on error
set -e

# Install PyInstaller and psycopg2
pip install pyinstaller psycopg2-binary

# Build the executable
pyinstaller --onefile --name main --hidden-import=psycopg2 game/main.py

# Verify that the executable was created with the correct name
EXECUTABLE_NAME="main.exe"
if [ -f "dist/$EXECUTABLE_NAME" ]; then
    echo "Executable found. Uploading to S3..."
    # Upload to S3
    aws s3 cp "dist/$EXECUTABLE_NAME" s3://builddb/main.exe
    echo "Upload complete."
else
    echo "Executable not found. Please check the build process."
    exit 1
fi
