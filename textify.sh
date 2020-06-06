#!/bin/sh

# turns ppt into html and text doc for grepping. From Noah.
unoconv -o html -f html "$@"
for x in html/*.html; do
    lynx -dump -width 9999 $x | perl -pe 's/^\s*//' > ${x%html}txt
done
