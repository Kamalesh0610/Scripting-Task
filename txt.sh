#! /bin/bash

INPUT_FILE="$1"

if [[ ! -f "$INPUT_FILE" ]]; then
    echo "File not found!"
    exit 1
fi

awk 'NR<5 {print} NR>=5 {if($0 ~ /welcome/) gsub(/give/, "learning"); print}' "$INPUT_FILE" > temp_file && mv temp_file "$INPUT_FILE"

echo "Replacement completed in file: $INPUT_FILE"
