#!/bin/sh

dir="colorblind_ultimate_1.3.0"
mkdir -p "$dir"

cp -r \
  ./changelog.txt \
  ./info.json \
  ./thumbnail.png \
  ./*.lua \
  data \
  graphics \
  locale \
  scenarios \
  scripts \
  "$dir/"

zip -r "${dir}.zip" "$dir"

rm -r "$dir/"
