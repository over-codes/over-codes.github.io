#!/bin/bash
# Generate HTML files from the markdown in this directory

for file in $(find . -name \*.md); do
	../oc-genblog/target/debug/oc-genblog --templates templates/\* $file > $file.html
done
