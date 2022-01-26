#!/bin/bash

set -eu

export version=$(cat version/version)-dev
echo $version > version/version

echo "Dev Version: $version"

pushd repo

yq e -i '.version = strenv(version)' charts/$CHART/Chart.yaml

# Add change to Git
git add charts/$CHART/Chart.yaml
git status
git commit -m "ci(release): bump $CHART to v$version"
