#!/bin/bash

file="${1:-sales.csv}"

if [[ -f "$file" ]]; then
    lines=$(wc -l < "$file")
    echo "Found $file ($lines lines)."
else
    echo "Can't find $file."
    exit 1
fi
