#!/bin/bash
# Move the date from file name to its content by inserting it in a given line number
# version: 0.2
# GPT+human cooperation + Unix grimmoire |  powered by
# WTFL

# Step 1: Pick up the date from the file name
for file in /home/fenix/delferro_hugo/content/de/posts/ba/*.md; do
    # Extract the date by removing the extension and everything after the first dash
    date=$(basename "$file" | cut -d'-' -f1-3)
    
    # Step 2: Insert the date as the second text line in the file contents
    sed -i "3i\date: $date" "$file"
    
    # Step 3: Remove the date from the file name and rename the file
    new_filename=$(basename "$file" | sed "s/$date-//")
    mv "$file" "/home/fenix/delferro_hugo/content/de/posts/ba/$new_filename"
done
