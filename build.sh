#!/bin/sh

info="$(cat info.json)"
version="${info##*'"version": "'}"
version="${version%%'"'*}"

dir="colorblind_ultimate_$version"
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

lua -E "$dir"/locale/generate-locale.lua "$dir"/locale/*/setting-options.cfg
rm "$dir"/locale/generate-locale.lua

zip -r "${dir}.zip" "$dir"

rm -r "$dir/"
