#!bin/bash
unset GIT_DIR
git pull
hugo --cachedir /tmp/hugo_cache -d ../public_html
