#!/bin/bash

set -eu

export version=$(cat version/version)

cd source-repo

gh release create v${version} \
  --title v${version} \
  --notes-file ../changelog/changelog
