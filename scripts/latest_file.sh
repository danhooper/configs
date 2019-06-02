#!/bin/bash
MTIME=${2:-7}
NEW_FILES=$(find $1 -type f -mtime -$MTIME | wc -l)
if [ "$NEW_FILES" -eq "0" ]; then
    echo "The latest file in $(readlink -f $1) is $(find $1 -type f -printf '%T+ %p\n' | sort -r | head -1)"
fi
