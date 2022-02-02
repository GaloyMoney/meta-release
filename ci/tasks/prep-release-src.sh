#!/bin/bash

set -eu

# ------------ CHANGELOG ------------

# Fetching Refs
export prev_ref=$(yq e '.image.git_ref' charts-repo/charts/$CHART/values.yaml)

if [[ $prev_ref == "" ]]; then
  export prev_ref=$(yq e ".$CHART.image.git_ref" charts-repo/charts/$CHART/values.yaml)
fi

export new_ref=$(cd repo && git rev-parse HEAD)

# Generate Changelog
if [[ $new_ref == $prev_ref ]]; then
  echo "Refs didn't change, changelog will be empty..."
  echo "" > artifacts/gh-release-notes.md
else
  pushd repo
    git cliff --config ../meta-release/config.toml $prev_ref..$new_ref > ../artifacts/gh-release-notes.md
  popd
fi

echo "CHANGELOG:"
echo "--------------------------------------------------"
cat artifacts/gh-release-notes.md
echo "--------------------------------------------------"

# ------------ BUMP VERSION ------------

echo -n "Prev Version: "
cat version/version
echo ""

# Initial Version
if [[ $(cat version/version) == "0.0.0" ]]; then
  echo "0.1.0" > version/version
# Figure out proper version to release
elif [[ $(cat artifacts/gh-release-notes.md | grep breaking) != '' ]] || [[ $(cat artifacts/gh-release-notes.md | grep feature) != '' ]]; then
  echo "Breaking change / Feature Addition found, bumping minor version..."
  bump2version minor --current-version $(cat version/version) --allow-dirty version/version
else
  echo "Only patches and fixes found - no breaking changes, bumping patch version..."
  bump2version patch --current-version $(cat version/version) --allow-dirty version/version
fi

echo -n "Release Version: "
cat version/version
echo ""

# ------------ ARTIFACTS ------------

cat version/version > artifacts/gh-release-tag
echo "v$(cat version/version) Release" > artifacts/gh-release-name
