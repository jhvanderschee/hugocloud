#!/bin/bash
# ... with love
# license: GPLv3
# script version 0.3
# rationale :   the specified by `$f` while looping in a given DPATH folder - refactor content/en/posts/df/*.md
# while processing the frontmatter fields

# # Script tree
# for f in $DPATH

# do
#   if [ -f $f -a -r $f ]; then
# #       additional logic here step1
# #       additional logic here step2
# #       and additional logic here step3
#   else
#    echo "Error: Cannot read $f"
#   fi
# done

DPATH="/home/fenix/delferro_hugo/content/en/posts/df/*.md"


for f in $DPATH
do
  if [ -f $f -a -r $f ]; then
    # Read the file contents
    content=$(cat $f)
    
    # Extract the front matter
    front_matter=$(echo "$content" | sed -n '1,/---/p')
    
    # Extract the image and youtube_id
    image=$(echo "$front_matter" | grep 'image:' | awk '{print $2}')
    youtube_id=$(echo "$front_matter" | grep 'youtube_id:' | awk '{print $2}')
    
    # Remove the image and youtube_id lines from the front matter
    front_matter=$(echo "$front_matter" | grep -v -e 'image:' -e 'youtube_id:')
    
    # Replace the front matter in the file content
    content=$(echo "$content" | sed "1,/---/c\---\n$front_matter")
    
    # Insert the image and youtube_id in the content below the front matter
    content=$(echo "$content" | sed "/---/a{{</*youtube_id=\"$youtube_id\" image=\"$image\" */>}}")
    
    # Write the updated content back to the file
    echo "$content" > $f
  else
    echo "Error: Cannot read $f"
  fi
done



# Rationale - extended :
#
# # This script reads each markdown file in the specified folder and performs the following steps for each file:
# # 1. Read the file contents.
# # 2. Extract the front matter.
# # 3. Extract the image and youtube_id.
# # 4. Remove the image and youtube_id lines from the front matter.
# # 5. Replace the front matter in the file content.
# # 6. Insert the image and youtube_id in the content below the front matter.
# # 7. Write the updated content back to the file.

