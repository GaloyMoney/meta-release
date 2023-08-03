#!/bin/bash

set -eu

export version=$(cat version/version)

pushd repo

git checkout main
git status
git merge -X theirs -m "ci: Update $CHART dev version to $version" release
git status
git --no-pager log -n 5
