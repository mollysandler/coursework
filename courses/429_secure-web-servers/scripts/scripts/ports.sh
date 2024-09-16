#!/bin/bash

# Configuration
HOST="team8.csc429.io"  # Change this to the IP you want to scan
BASELINE_FILE="../backups/ports/baseline_scan.txt"
CURRENT_SCAN_FILE="../backups/ports/current_scan.txt"

# Function to perform a scan with service detection and vulnerability scripts
perform_scan() {
    # Redirecting both stdout and stderr to the file
    sudo nmap -p- -sV --script=vuln $HOST > $1 2>&1
}

# Function to compare scans
compare_scans() {
    echo "Comparing current scan with the baseline..."
    diff $BASELINE_FILE $CURRENT_SCAN_FILE
}

# Main execution flow
if [ ! -f "$BASELINE_FILE" ]; then
    echo "No baseline found. Creating baseline scan..."
    perform_scan $BASELINE_FILE
    echo "Baseline scan saved."
else
    echo "Baseline found. Performing current scan..."
    perform_scan $CURRENT_SCAN_FILE
    compare_scans
fi
