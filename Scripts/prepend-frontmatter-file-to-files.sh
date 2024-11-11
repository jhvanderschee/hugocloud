#!/bin/bash
# inspiration : $ cat frontmatter.md file1.md > temp && mv temp file1.md
# version : 0.2
# license: GPLv3
# rationale :
# 1. It concatenates the contents of `frontmatter.md` and `file1.md` and saves the output to a temporary file named `temp`.
# 2. If the concatenation is successful (i.e., no errors occur), it then renames `temp` as `file1.md`, effectively replacing the original `file1.md` with the merged content.

# Essentially, this command merges the content of `frontmatter.md` with `file1.md` and updates `file1.md` with the merged result.

#  given the following '/tmp/sandbox1'  directory :
# ```
# frontmatter.md
# file1.md
# file2.md
# file3.md
# ```

# how would you run the previous script to all file*.md files ?


for file in /home/fenix/precontent/MD-masterplanning-WHAT-projects/*.md; do
  cat ~/precontent/frontmatter.md "$file" > /tmp/sandbox1/temp && mv /tmp/sandbox1/temp "$file"
done



# This script iterates over each `file*.md` file in the `/tmp/sandbox1` directory and performs the script sequence for each one. It concatenates `frontmatter.md` with the current `file*.md` file, saves the output to a temporary file named `temp`, and then renames `temp` as `file*.md`, effectively merging the contents.


