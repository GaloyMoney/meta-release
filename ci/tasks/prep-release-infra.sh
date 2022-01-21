#!/bin/bash

set -eu

if ! [[ -f changelog/changelog ]]; then
  echo "No changelog found, shouldn't run without changelog, skipping..."
  exit 0
fi

echo -n "Old Version: "
cat version/version
echo ""

if [[ $(cat changelog/changelog | grep breaking) != '' ]] || [[ $(cat changelog/changelog | grep feature) != '' ]]; then
  echo "Breaking change / Feature Addition found, bumping minor version..."
  bump2version minor --current-version $(cat version/version) --allow-dirty version/version
else
  echo "Only patches and fixes found - no breaking changes or features, bumping patch version..."
  bump2version patch --current-version $(cat version/version) --allow-dirty version/version
fi

echo -n "New Version: "
cat version/version
echo ""

export version=$(cat version/version)

echo "v$version Release" > gh-release/name
echo "v$version" > gh-release/tag
cat changelog/changelog > gh-release/notes.md

commitid=$(cat release-commitid/commitid)

cd repo-stable
git checkout $commitid
