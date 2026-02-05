#!/bin/bash

file="Files/emails.txt"

# Check file exists
if [ ! -f "$file" ]; then
    echo "Error: emails.txt not found."
    exit 1
fi

# Extract valid emails
grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' "$file" | sort | uniq > valid.txt

# Extract invalid emails
grep -Ev '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' "$file" > invalid.txt

echo "Valid emails stored in valid.txt"
echo "Invalid emails stored in invalid.txt"
echo "Duplicates removed from valid emails."
