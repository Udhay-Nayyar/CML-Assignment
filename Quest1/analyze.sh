#!/bin/bash

# Check argument count
if [ "$#" -ne 1 ]; then
    echo "Error: Exactly one argument required."
    exit 1
fi

path=$1

# Check if path exists
if [ ! -e "$path" ]; then
    echo "Error: Path does not exist."
    exit 1
fi

# If file
if [ -f "$path" ]; then
    echo "It is a file."
    echo "Lines: $(wc -l < "$path")"
    echo "Words: $(wc -w < "$path")"
    echo "Characters: $(wc -m < "$path")"

# If directory
elif [ -d "$path" ]; then
    echo "It is a directory."

    total_files=$(find "$path" -type f | wc -l)
    txt_files=$(find "$path" -type f -name "*.txt" | wc -l)

    echo "Total files: $total_files"
    echo ".txt files: $txt_files"
fi
