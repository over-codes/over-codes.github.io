#!/bin/bash
# Generate HTML files from the markdown in this directory

for file in $(find . -name \*.md); do
	oc-genblog --base_url https://over-codes.github.io --templates templates/\* $file
done
