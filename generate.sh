#!/bin/bash
# Generate HTML files from the markdown in this directory

for file in $(find . -name \*.md); do
	oc-genblog --templates templates/\* $file > ${file%.md}.html
done
