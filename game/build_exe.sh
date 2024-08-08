#!/bin/bash

# Exit on error
set -e

# Install PyInstaller and psycopg2
pip install pyinstaller psycopg2-binary

# Build the executable
pyinstaller --onefile --hidden-import=psycopg2 src/ui.py

# Check if the executable was successfully created
if [ -f dist/ui.exe ]; then
    echo "Executable found. Uploading to S3..."
    # Upload to S3
    aws s3 cp dist/ui.exe s3://nomad-tictactoe-project/tictactoe-executable.exe
    echo "Upload complete."
else
    echo "Executable not found. Please check the build process."
    exit 1
fi
