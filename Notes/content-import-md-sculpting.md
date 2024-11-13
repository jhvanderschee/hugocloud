---
title: Hugo pre Ops ~ content (& site architecture )  processing 
description: 
categories: 
keywords: [content]
---

Before we enter the real Hugocloud / HugOps field que might have some previous tasks to accomplish. 


## Assumptions / context :

* Have a Wordpress/Drupal(... etc ) dynamic sote you want to import content from and share it again with the world in the form of a Hugo based SSG website.
* You have some CLI / termianl basic scripting knowledge (it always help!)


## Original (source) website analysis 

Look for the sitemap ~ typically https://example.com/sitemap.xml 
Make a clean list of URLs from
This already gives you a basic idea of the website's content &  architecture you are dealing with. Helfpulf for the content processing strategy.


## Toolbox & Scripts

HTML to markdown.md formatted files conversion ~ powerful tool:

Let's use this [simple Curl based + API](https://html-to-markdown.com)

To programmatically convert the contents of https://example.org to Markdown files while preserving the website's folder structure, you can use the html-to-markdown API in combination with tools like wget for Bash or requests and BeautifulSoup for Python. Below are step-by-step guides for both approaches.

### Bash Script Approach:

#### Download the Website 
Use wget to recursively download the website's HTML content while maintaining the directory structure.

```bash
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent https://example.org
```

This command will create a local copy of the website in a directory named example.org.

#### Convert HTML to Markdown: Iterate through the downloaded HTML files and convert each to Markdown using the html-to-markdown API.

```
#!/bin/bash

API_KEY="fenixAPIkey"
BASE_URL="https://api.html-to-markdown.com/v1/convert"
INPUT_DIR="example.org"
OUTPUT_DIR="markdown_output

mkdir -p "$OUTPUT_DIR"

find "$INPUT_DIR" -name "*.html" | while read -r html_file; do
    relative_path="${html_file#$INPUT_DIR/}"
    markdown_file="$OUTPUT_DIR/${relative_path%.html}.md"
    mkdir -p "$(dirname "$markdown_file")"

    html_content=$(<"$html_file")
    response=$(curl -s -X POST "$BASE_URL" \
        -H "X-API-Key: $API_KEY" \
        -H "Content-Type: application/json" \
        -d "{\"html\": \"$html_content\"}")

    markdown_content=$(echo "$response" | jq -r '.markdown')
    echo "$markdown_content" > "$markdown_file"
done
```


This script reads each HTML file, sends its content to the API, and writes the returned Markdown to the corresponding location in the markdown_output directory.


> Notes:

-    Ensure you have the necessary permissions to download and convert the website's content.
-    The html-to-markdown API requires an API key (fenixAPIkey in this example). Keep this key secure and do not expose it in client-side code.
-    The html-to-markdown API has rate limits. For extensive conversions, consider contacting the service provider to discuss usage limits.
-    After conversion, review the Markdown files to ensure the content has been accurately transformed, as some complex HTML structures may require manual adjustments.

By following these steps, you can automate the process of converting a website's HTML content into Markdown files while preserving the original directory structure.
