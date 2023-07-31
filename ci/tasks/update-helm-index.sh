#!/bin/bash

set -eu

pushd repo

# Chart Releaser Packages to be released
mkdir -p .cr-index .cr-release-packages
cp -R ../gh-release/files/* .cr-release-packages

cr index -c $CHART_GIT_REPO_HTTPS_URL --release-name-template "{{ .Name }}-v{{ .Version }}"

# Fetching index change
export NEW_CHART_ENTRY=$(yq -e ".entries.[\"${CHART}\"].0" .cr-index/index.yaml)
export GENERATION_TIME=$(yq -e '.generated' .cr-index/index.yaml)

yq -e --in-place -Y ".entries.[\"${CHART}\"] |= [\"${NEW_CHART_ENTRY}\"] + . " index.yaml
yq -e --in-place -Y ".generated = \"${GENERATION_TIME}\"" index.yaml

git add index.yaml
git status
git commit -m "ci(release): helm index update for $CHART"
