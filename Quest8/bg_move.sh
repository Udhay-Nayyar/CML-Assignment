#!/bin/bash

# Check argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

dir=$1
backup="$dir/backup"

# Check directory exists
if [ ! -d "$dir" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

# Create backup folder if not present
mkdir -p "$backup"

echo "Main Script PID: $$"
echo "Moving files to backup in background..."
echo ""

for file in "$dir"/*
do
    # Skip backup folder itself
    if [ "$file" == "$backup" ]; then
        continue
    fi

    if [ -f "$file" ]; then
        mv "$file" "$backup/" &

        echo "Moved $(basename "$file") → PID: $!"
    fi
done

# Wait for all background processes
wait

echo ""
echo "All background moves completed."
