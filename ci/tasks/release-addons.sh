#!/bin/bash

set -eu

# Galoy
export galoy=$(yq e '.galoy' repo/release.yml)

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
export admin_panel=$(cat addons-in/modules/services/addons/vendor/admin-panel/git-ref/ref)
export galoy_pay=$(cat addons-in/modules/services/addons/vendor/galoy-pay/git-ref/ref)
export dealer=$(cat addons-in/modules/services/addons/vendor/dealer/git-ref/ref)

# Generate readme
envsubst < repo/template.md > repo/README.md
cat repo/README.md

# Generate yml
yq e -i '.admin_panel = strenv(admin_panel)' repo/release.yml
yq e -i '.galoy_pay = strenv(galoy_pay)' repo/release.yml
yq e -i '.dealer = strenv(dealer)' repo/release.yml

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
git commit -m "ci(release): publish new release for addons"
)
