#!/bin/bash

set -eu

if [[ -z $(git config --global user.email) ]]; then
  git config --global user.email "bot@galoy.io"
fi
if [[ -z $(git config --global user.name) ]]; then
  git config --global user.name "CI Bot"
fi

export version=$(cat version/version)

pushd repo

git checkout main
git status
git merge -X theirs -m "ci: Update $CHART dev version to $version" release
git status
git log -n 5
