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

# Figure out proper version to release
if [[ $(cat changelog/changelog | grep breaking) != '' ]] || [[ $(cat changelog/changelog | grep feature) != '' ]]; then
  echo "Breaking change / Feature Addition found, bumping minor version..."
  bump2version minor --current-version $(cat version/version) --allow-dirty version/version
else
  echo "Only patches and fixes found - no breaking changes, bumping patch version..."
  bump2version patch --current-version $(cat version/version) --allow-dirty version/version
fi

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

  # Installing Helm Dependencies
  if [[ $(helm dependency list charts/$CHART | wc -l) != 1 ]]; then
    helm dependency list charts/$CHART | tail -n +2 | awk 'NF { print $1,$3 }' | grep -v ^WARNING | xargs -n 2 helm repo add
  fi

  # Getting TGZ files for release
  cr package charts/$CHART
  cp -R .cr-release-packages/* ../gh-release/files
popd

echo "$CHART-v$version Release" > gh-release/name
echo "$CHART-v$version" > gh-release/tag
cat changelog/changelog > gh-release/notes.md
