#!/bin/bash

set -eu

. repo/ci/tasks/refs.sh

export infra=$(cat infra-in/modules/infra/vendor/git-ref/ref)
export infra_release_tag=$(cat version/version)

# Generate readme
envsubst < repo/template.md > repo/README.md
cat repo/README.md

# Generate yml
yq e -i '.infra = strenv(infra)' repo/release.yml

cd repo

if [[ -z $(git config --global user.email) ]]; then
  git config --global user.email "bot@galoy.io"
fi
if [[ -z $(git config --global user.name) ]]; then
  git config --global user.name "CI Bot"
fi

(
  cd $(git rev-parse --show-toplevel)
  git add -A
  git status
  git commit -m "ci(release): publish new release for infra"
)
