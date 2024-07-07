#!/bin/bash

# Define the target directory
TARGET_DIR="octobot"

# Check if the target directory exists
if [ -d "$TARGET_DIR" ]; then
    # Loop through all items in the target directory
    for dir in "$TARGET_DIR"/*/ ; do
        # Check if the item is a directory
        if [ -d "$dir" ]; then
            # Change to the directory
            cd "$dir"
            # Check if it's a git repository
            if [ -d ".git" ]; then
                # Print the directory name
                echo "=== Git status in $dir ==="
                # Run git status
                git status
                echo ""
            fi
            # Change back to the target directory
            cd - > /dev/null
        fi
    done
else
    echo "The directory $TARGET_DIR does not exist."
fi
