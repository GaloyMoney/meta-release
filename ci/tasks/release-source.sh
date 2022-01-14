#!/bin/bash

set -eu

if ! [[ -f changelog/changelog ]]; then
  echo "No changelog found, skipping..."
  exit 0
fi

export version=$(cat version/version)

cd source-repo

gh release create v${version} \
  --title v${version} \
  --notes-file ../changelog/changelog
