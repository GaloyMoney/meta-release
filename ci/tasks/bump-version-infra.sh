#!/bin/bash

set -eu

if ! [[ -f changelog/changelog ]]; then
  echo "No changelog found, skipping..."
  exit 0
fi

if [[ $(cat changelog/changelog | grep breaking) != '' ]]; then
  # Breaking
  echo "Breaking change found, bumping minor version..."
  export new_version=$(cat version/version | awk -F. '{$(NF-1) = $(NF-1) + 1;} 1' | sed 's/ /./g')
else
  # Non-Breaking
  echo "Only patches and fixes found - no breaking changes, bumping patch version..."
  export new_version=$(cat version/version | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g')
fi

echo -n "Old Version: "
cat version/version

echo $new_version > version/version

echo ""
echo -n "New Version: "
cat version/version
