#!/bin/bash

file="Files/input.txt"

# Check file exists
if [ ! -f "$file" ]; then
    echo "Error: input.txt not found."
    exit 1
fi

# Convert text into one-word-per-line
words=$(tr -cs '[:alnum:]' '\n' < "$file")

# Longest word
longest=$(echo "$words" | awk '{ print length, $0 }' | sort -nr | head -1 | cut -d" " -f2)

# Shortest word
shortest=$(echo "$words" | awk '{ print length, $0 }' | sort -n | head -1 | cut -d" " -f2)

# Average word length
avg=$(echo "$words" | awk '{ total += length; count++ } END { if(count>0) print total/count; else print 0 }')

# Unique words count
unique=$(echo "$words" | sort | uniq | wc -l)

echo "Longest word: $longest"
echo "Shortest word: $shortest"
echo "Average word length: $avg"
echo "Total unique words: $unique"

