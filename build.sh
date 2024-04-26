#!/bin/sh

dir="colorblind_ultimate_1.0.0"
mkdir -p "$dir"

cp -r \
  ./info.json \
  ./thumbnail.png \
  ./*.lua \
  graphics \
  scenarios \
  scripts \
  "$dir/"

zip -r "${dir}.zip" "$dir"

rm -r "$dir/"
