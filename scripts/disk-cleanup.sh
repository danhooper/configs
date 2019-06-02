#!/bin/bash

set -e

DISK_PATH="$1"

if [ "$DISK_PATH" == "" ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

echo "Merging all duplicates in $DISK_PATH"

/usr/share/fslint/fslint/findup -m "$DISK_PATH" -size -1M &> /dev/null
/usr/share/fslint/fslint/findup -m "$DISK_PATH" -size +1M -size -10M &> /dev/null
/usr/share/fslint/fslint/findup -m "$DISK_PATH" -size +10M -size -100M &> /dev/null
/usr/share/fslint/fslint/findup -m "$DISK_PATH" -size +100M -size -1000M &> /dev/null
/usr/share/fslint/fslint/findup -m "$DISK_PATH" -size +1000M &> /dev/null
