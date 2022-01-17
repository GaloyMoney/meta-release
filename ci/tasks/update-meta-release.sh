#!/bin/bash

set -eu

. repo/ci/tasks/refs.sh

export infra=$(cat infra-in/modules/infra/vendor/git-ref/ref)
export infra_release_tag=v$(cat version/version)

# Generate readme
envsubst < repo/template.md > repo/README.md
cat repo/README.md

# Generate yml
yq e -i '.infra.commit = strenv(infra)' repo/release.yml
yq e -i '.infra.release_tag = strenv(infra_release_tag)' repo/release.yml

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
