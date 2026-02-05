#!/bin/bash

file="Files/input.txt"

# Check file exists
if [ ! -f "$file" ]; then
    echo "Error: input.txt not found."
    exit 1
fi

# Convert words to one per line, ignore punctuation
words=$(tr -cs '[:alpha:]' '\n' < "$file")

# ONLY vowels
echo "$words" | grep -iE '^[aeiou]+$' > vowels.txt

# ONLY consonants
echo "$words" | grep -iE '^[bcdfghjklmnpqrstvwxyz]+$' > consonants.txt

# Mixed but starting with consonant
echo "$words" | grep -iE '^[bcdfghjklmnpqrstvwxyz][a-z]*[aeiou][a-z]*$' > mixed.txt

echo "Words containing only vowels → vowels.txt"
echo "Words containing only consonants → consonants.txt"
echo "Mixed words starting with consonant → mixed.txt"
