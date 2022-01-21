#!/bin/bash

set -eu

if [[ $(cat changelog/changelog | grep breaking) != '' ]] || [[ $(cat changelog/changelog | grep feature) != '' ]]; then
  echo "Breaking change / Feature Addition found, bumping minor version..."
  bump2version minor --current-version $(cat version/version) --allow-dirty version/version
else
  echo "Only patches and fixes found - no breaking changes, bumping patch version..."
  bump2version patch --current-version $(cat version/version) --allow-dirty version/version
fi

export version=$(cat version/version)-dev
echo $version > version/version

echo "Dev Version bumped to: $version"

pushd repo

yq e -i '.version = strenv(version)' charts/$CHART/Chart.yaml

# Setup Config
if [[ -z $(git config --global user.email) ]]; then
  git config --global user.email "bot@galoy.io"
fi
if [[ -z $(git config --global user.name) ]]; then
  git config --global user.name "CI Bot"
fi

# Add change to Git
git add charts/$CHART/Chart.yaml
git status
git commit -m "ci(release): bump $CHART to v$version"
