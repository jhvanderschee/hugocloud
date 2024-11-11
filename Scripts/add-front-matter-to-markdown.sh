#!/usr/bin/env bash
# source : Joe Mooring - https://www.veriphor.com/articles/working-with-raw-markdown/
#
# Last modified: 2023-07-05T11:04:09-07:00

#------------------------------------------------------------------------------
# Copyright 2023 Veriphor LLC
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# @file
# Recursively converts a directory of raw markdown files to markdown with front matter.
#
# See usage().
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# @function
# Displays usage message.
#
# @return string $msg
#   The usage message.
#------------------------------------------------------------------------------
usage() {
  declare msg
  msg=$(cat <<EOT
Recursively converts a directory of raw markdown files to markdown
with front matter.

This script:

- Does not alter the source directory
- Creates the target directory if needed
- Does not overwrite existing files in the target directory
- Adds front matter to each markdown (md) file
- Copies other file types without modification

If the raw markdown contains a level 1 ATX heading, the script removes
the heading, using it as the front matter title. If a level 1 ATX
heading is not present, the title is the file name. The front matter
date is the file modification time.

Usage:    $(basename "$0") source target [format]

          format: toml (default), yaml, or json

Examples: $(basename "$0") raw-content/ content/
          $(basename "$0") raw-content/ content/ yaml
EOT
  )
  printf "%s\\n\\n" "${msg}"
}

#------------------------------------------------------------------------------
# @function
# Main function.
#
# @param string $source_dir
#   The source directory.
# @param string $target_dir
#   The target directory.
# @param string $format
#   The front matter format: json, toml (default), or yaml
#------------------------------------------------------------------------------
main() {

  declare source_dir=${1:-}
  declare target_dir=${2:-}
  declare format=${3:-toml}
  declare term_red='\033[0;31m'
  declare term_reset='\033[0m'
  declare date entry entries ext title
  declare source_content target_content
  declare source_path target_path

  # Convert format to lowercase.
  format=${format,,}

  # Validate arguments.
  if [[ -n "${source_dir}" ]]; then
    source_dir=$(realpath "${source_dir}")
  else
    >&2 echo -e "\n${term_red}Error: please specify source directory\n${term_reset}"
    >&2 usage; exit 1
  fi

  if [[ ! -d "${source_dir}" ]]; then
    >&2 echo -e "\n${term_red}Error: source directory does not exist\n${term_reset}"
    >&2 usage; exit 1
  fi

  if [[ -n "${target_dir}" ]]; then
    target_dir=$(realpath "${target_dir}")
  else
    >&2 echo -e "\n${term_red}Error: please specify target directory\n${term_reset}"
    >&2 usage; exit 1
  fi

  if [[ -n "${format}" && ! "${format}" =~ ^(toml|yaml|json)$ ]]; then
    >&2 echo -e "\n${term_red}Error: invalid front matter format\n${term_reset}"
    >&2 usage; exit 1
  fi

  # Create target directory if it does not exist.
  if [[ ! -d "${target_dir}" ]]; then
    mkdir -p "${target_dir}"
  fi

  # Create an array of the entries within the source directory.
  readarray -d '' entries < <(find "${source_dir}" -printf "%P\0")

  # Process each entry.
  for entry in "${entries[@]}"; do
    source_path=${source_dir}/${entry}
    target_path=${target_dir}/${entry}
    # Don't do anything if the target file or directory exists.
    if [[ ! -e "${target_path}" ]]; then
      if [[ -d "${source_path}" ]]; then
        # The entry is a directory.
        mkdir -p "${target_path}"
      else
        # The entry is a file.
        ext=${entry##*.}
        if [[ "${ext}" == "md" ]]; then
          # The entry is a markdown file.
          date=$(stat "${source_path}" --printf %y)
          date=$(date -d "${date}" --iso-8601=seconds)
          title=$(awk '/^# / {$1=""; print substr($0,2); exit}' "${source_path}")
          source_content=$(cat "${source_path}")
          if [[ -n "${title}" ]]; then
            # The markdown file has a level 1 ATX heading. Remove it.
            source_content=$(sed '0,/^# /{//d}' "${source_path}")
          else
            # The markdown file does not have a level 1 ATX heading.
            title=$(basename "${source_path}" ".md")
          fi

          if [[ "${format}" == "toml" ]]; then
            target_content=$(cat <<EOT
+++
title = "${title}"
date = ${date}
draft = false
+++

${source_content}
EOT
)
          elif [[ "${format}" == "yaml" ]]; then
            target_content=$(cat <<EOT
---
title: ${title}
date: ${date}
draft: false
---

${source_content}
EOT
)
          elif [[ "${format}" == "json" ]]; then
            target_content=$(cat <<EOT
{
  "title": "${title}",
  "date": "${date}",
  "draft": false
}

${source_content}
EOT
)
          fi
          printf "%s\\n" "${target_content}" > "${target_path}"
        else
          # The entry is a file, but not markdown.
          cp "${source_path}" "${target_path}"
        fi
      fi
    fi
  done
}

set -euo pipefail
main "$@"

# Usage:  add-front-matter-to-markdown.sh source target [format]
#
#         format: toml (default), yaml, or json
#
# see source blogpost by Joe Mooring - https://www.veriphor.com/articles/working-with-raw-markdown/
