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

export version=$(cat version/version)
echo "Release Version: $version"

mkdir -p gh-release/files

pushd repo

  # Update version in Chart.yml
  yq e -i '.version = strenv(version)' charts/$CHART/Chart.yaml

  # Add change to Git
  git add charts/$CHART/Chart.yaml
  git status
  git commit -m "ci(release): $CHART release v$version"

  # Getting TGZ files for release
  cr package charts/$CHART
  cp -R .cr-release-packages/* ../gh-release/files
popd

echo "$CHART-v$version Release" > gh-release/name
echo "$CHART-v$version" > gh-release/tag
cat changelog/changelog > gh-release/notes.md
