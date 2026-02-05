#!/bin/bash

file="Files/marks.txt"

# Check file exists
if [ ! -f "$file" ]; then
    echo "Error: marks.txt not found."
    exit 1
fi

failed_one=0
passed_all=0

echo "Students who failed in exactly ONE subject:"
echo "------------------------------------------"

while IFS=',' read -r roll name m1 m2 m3
do
    fail_count=0

    # Check each subject
    if [ "$m1" -lt 33 ]; then
        ((fail_count++))
    fi

    if [ "$m2" -lt 33 ]; then
        ((fail_count++))
    fi

    if [ "$m3" -lt 33 ]; then
        ((fail_count++))
    fi

    if [ "$fail_count" -eq 1 ]; then
        echo "$roll - $name"
        ((failed_one++))
    fi

    if [ "$fail_count" -eq 0 ]; then
        echo "$roll - $name (Passed All)"
        ((passed_all++))
    fi

done < "$file"

echo ""
echo "Summary:"
echo "Students failed in exactly one subject: $failed_one"
echo "Students passed in all subjects: $passed_all"
