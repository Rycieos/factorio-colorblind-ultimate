#!/bin/sh

dir="colorblind_ultimate_0.1.0"
mkdir -p "$dir"

cp -r \
  ./info.json \
  ./thumbnail.png \
  ./*.lua \
  graphics \
  scripts \
  "$dir/"

zip -r "${dir}.zip" "$dir"

rm -r "$dir/"
