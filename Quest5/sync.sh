#!/bin/bash

dirA="Files/dirA"
dirB="Files/dirB"

# Check directories exist
if [ ! -d "$dirA" ] || [ ! -d "$dirB" ]; then
    echo "Error: One or both directories do not exist."
    exit 1
fi

echo "Files only in dirA:"
echo "-------------------"
for file in "$dirA"/*
do
    name=$(basename "$file")
    if [ ! -f "$dirB/$name" ]; then
        echo "$name"
    fi
done

echo ""
echo "Files only in dirB:"
echo "-------------------"
for file in "$dirB"/*
do
    name=$(basename "$file")
    if [ ! -f "$dirA/$name" ]; then
        echo "$name"
    fi
done

echo ""
echo "Comparing common files:"
echo "-----------------------"

for file in "$dirA"/*
do
    name=$(basename "$file")

    if [ -f "$dirB/$name" ]; then
        cmp -s "$dirA/$name" "$dirB/$name"

        if [ $? -eq 0 ]; then
            echo "$name → Contents MATCH"
        else
            echo "$name → Contents DIFFER"
        fi
    fi
done
