#!/bin/bash

# Install PyInstaller
pip install pyinstaller

# Build executable
pyinstaller --onefile main.py

# The executable will be located in the `dist` folder
