#!/bin/bash

set -eu

export version=$(cat version/version)

echo "v$version Release" > gh-release/name
echo "v$version" > gh-release/tag
cat changelog/changelog > gh-release/notes.md

commitid=$(cat source-release-commitid/commitid)

cd source-repo
git checkout $commitid
