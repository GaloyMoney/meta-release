#!/bin/bash

set -eu

if ! [[ -f changelog/changelog ]]; then
  echo "No changelog found, shouldn't run without changelog, skipping..."
  exit 0
fi

echo -n "Dev Version being released: "
cat version/version
echo ""

# Strips off "-dev"
bump2version pre --current-version $(cat version/version) --allow-dirty version/version

# Update version in Chart.yml
export version=$(cat version/version)
yq e -i '.version = strenv(version)' repo/charts/$CHART/Chart.yaml

echo "Release Version: $version"

# Getting TGZ files for release
mkdir -p gh-release/files
pushd repo
  cr package charts/$CHART
  cp -R .cr-release-packages ../gh-release/files
popd

echo "$CHART-v$version Release" > gh-release/name
echo "$CHART-v$version" > gh-release/tag
cat changelog/changelog > gh-release/notes.md
