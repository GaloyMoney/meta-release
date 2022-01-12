#!/bin/bash

set -eu

# Galoy
export galoy=$(yq e '.galoy' repo/release.yml)

# Infra
export infra=$(yq e '.infra' repo/release.yml)

# Bitcoind
export bitcoind=$(cat bitcoin-in/modules/services/bitcoin/vendor/bitcoind/git-ref/ref)
export lnd=$(cat bitcoin-in/modules/services/bitcoin/vendor/lnd1/git-ref/ref)
export rtl=$(cat bitcoin-in/modules/services/bitcoin/vendor/rtl/git-ref/ref)
export specter=$(cat bitcoin-in/modules/services/bitcoin/vendor/specter/git-ref/ref)

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
yq e -i '.bitcoind = strenv(bitcoind)' repo/release.yml
yq e -i '.lnd = strenv(lnd)' repo/release.yml
yq e -i '.rtl = strenv(rtl)' repo/release.yml
yq e -i '.specter = strenv(specter)' repo/release.yml

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
git commit -m "ci(release): publish new release for bitcoin"
)
