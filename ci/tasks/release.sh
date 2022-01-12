#!/bin/bash

set -eu

# envsubst
apk add gettext

# Galoy
export galoy=$(cat galoy-in/modules/galoy/vendor/galoy/git-ref/ref)

# Infra
export infra=$(cat infra-in/modules/infra/vendor/git-ref/ref)

# Bitcoind
export bitcoind=$(cat bitcoin-in/modules/services/bitcoin/vendor/bitcoind/git-ref/ref)
export lnd=$(cat bitcoin-in/modules/services/bitcoin/vendor/lnd1/git-ref/ref)
export rtl=$(cat bitcoin-in/modules/services/bitcoin/vendor/rtl/git-ref/ref)
export specter=$(cat bitcoin-in/modules/services/bitcoin/vendor/specter/git-ref/ref)

# Monitoring
export monitoring=$(cat monitoring-in/modules/services/monitoring/vendor/monitoring/git-ref/ref)
export lndmon=$(cat monitoring-in/modules/services/monitoring/vendor/lndmon/git-ref/ref)

# Addons
export admin_panel=$(cat addons-in/modules/services/addons/vendor/admin-panel/git-ref/ref)
export galoy_pay=$(cat addons-in/modules/services/addons/vendor/galoy-pay/git-ref/ref)
export dealer=$(cat addons-in/modules/services/addons/vendor/dealer/git-ref/ref)

# Generate readme
envsubst < repo/template.md > repo/README.md
cat repo/README.md

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
git commit -m "Publish new release"
)
