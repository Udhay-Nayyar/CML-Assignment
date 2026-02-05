#!/bin/bash

# Check argument count
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide exactly one log file."
    exit 1
fi

logfile=$1

# Check if file exists
if [ ! -f "$logfile" ]; then
    echo "Error: File does not exist."
    exit 1
fi

# Check readability
if [ ! -r "$logfile" ]; then
    echo "Error: File is not readable."
    exit 1
fi

total=$(wc -l < "$logfile")
info=$(grep -c "INFO" "$logfile")
warning=$(grep -c "WARNING" "$logfile")
error=$(grep -c "ERROR" "$logfile")

recent_error=$(grep "ERROR" "$logfile" | tail -n 1)

echo "Total log entries: $total"
echo "INFO messages: $info"
echo "WARNING messages: $warning"
echo "ERROR messages: $error"

if [ -z "$recent_error" ]; then
    echo "No ERROR messages found."
else
    echo "Most recent ERROR: $recent_error"
fi

report="logsummary_$(date +%F).txt"

{
echo "Log Summary Report"
echo "-------------------"
echo "Total log entries: $total"
echo "INFO messages: $info"
echo "WARNING messages: $warning"
echo "ERROR messages: $error"
echo "Most recent ERROR: $recent_error"
} > "$report"

echo "Report generated: $report"

