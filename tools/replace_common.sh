#!/bin/bash

# Usage: ./replace_common.sh <target_script.sh>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <target_script.sh>"
    exit 1
fi

TARGET_FILE="$1"
COMMON_FILE="common.txt"
PHRASE="COMMON PART ENDS HERE"

if ! grep -q "$PHRASE" "$TARGET_FILE"; then
    echo "Phrase '$PHRASE' not found in $TARGET_FILE"
    exit 1
fi

# Find the line number of the phrase
LINE_NUM=$(grep -n "$PHRASE" "$TARGET_FILE" | head -n1 | cut -d: -f1)

# Output common part
cat "$COMMON_FILE" > temp_replace_common.tmp
# Output the rest of the file after the phrase
awk "NR > $LINE_NUM" "$TARGET_FILE" >> temp_replace_common.tmp

# Replace the original file
mv temp_replace_common.tmp "$TARGET_FILE"

echo "Replaced common part in $TARGET_FILE with $COMMON_FILE up to and including line $LINE_NUM." 
