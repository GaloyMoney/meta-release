#!/bin/bash

set -eu

# Galoy
export galoy=$(cat galoy-in/modules/galoy/vendor/galoy/git-ref/ref)

# Infra
export infra=$(yq e '.infra' repo/release.yml)

# Bitcoind
export bitcoind=$(yq e '.bitcoind' repo/release.yml)
export lnd=$(yq e '.lnd' repo/release.yml)
export rtl=$(yq e '.rtl' repo/release.yml)
export specter=$(yq e '.specter' repo/release.yml)

# Monitoring
export monitoring=$(yq e '.monitoring' repo/release.yml)
export lndmon=$(yq e '.lndmon' repo/release.yml)

# Addons
export admin_panel=$(yq e '.admin_panel' repo/release.yml)
export galoy_pay=$(yq e '.galoy_pay' repo/release.yml)
export dealer=$(yq e '.dealer' repo/release.yml)

# Generate readme
envsubst < repo/template.md > repo/README.md
cat repo/README.md

# Generate yml
yq e -i '.galoy = strenv(galoy)' repo/release.yml

cd repo

if [[ -z $(git config --global user.email) ]]; then
  git config --global user.email "bot@galoy.io"
fi
if [[ -z $(git config --global user.name) ]]; then
  git config --global user.name "CI Bot"
fi

(cd $(git rev-parse --show-toplevel)
git merge --no-edit main
git add -A
git status
git commit -m "ci(release): publish new release for galoy"
)
