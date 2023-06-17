#!/bin/bash

declare -a files=($(find . -type f -name "*.ts" -maxdepth 1 | sort))
count=1

for file in "${files[@]}"; do
    echo "$count: $file"
    ((count++))
done

echo "Enter the number of the file you want to convert:"
read choice

if [[ "$choice" -gt 0 && "$choice" -le "${#files[@]}" ]]; then
    input_file="${files[$choice-1]}"
    mkdir -p mp4
    output_file="./mp4/${input_file%.*}.mp4"
    ffmpeg -i "$input_file" -c:v libx264 -f mp4 "$output_file"
    echo "Conversion completed!"
else
    echo "Invalid choice"
fi
