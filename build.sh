#!/bin/sh

dir="colorblind_ultimate_1.2.0"
mkdir -p "$dir"

cp -r \
  ./changelog.txt \
  ./info.json \
  ./thumbnail.png \
  ./*.lua \
  graphics \
  scenarios \
  scripts \
  "$dir/"

zip -r "${dir}.zip" "$dir"

rm -r "$dir/"
