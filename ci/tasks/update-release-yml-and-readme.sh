#!/bin/bash

set -eu

# Galoy
export galoy=$(cat galoy/commit_sha)
export galoy_release_tag=$(cat galoy/tag)

# Infra
export infra=$(cat infra/commit_sha)
export infra_release_tag=$(cat infra/tag)

# Bitcoind
export bitcoind=$(cat bitcoind/commit_sha)
export lnd=$(cat lnd/commit_sha)
export rtl=$(cat rtl/commit_sha)
export specter=$(cat specter/commit_sha)

export bitcoind_release_tag=$(cat bitcoind/tag)
export lnd_release_tag=$(cat lnd/tag)
export rtl_release_tag=$(cat rtl/tag)
export specter_release_tag=$(cat specter/tag)

# Monitoring
export monitoring=$(cat monitoring/commit_sha)
export lndmon=$(cat lndmon/commit_sha)

export monitoring_release_tag=$(cat monitoring/tag)
export lndmon_release_tag=$(cat lndmon/tag)

# Addons
export admin_panel=$(cat admin_panel/commit_sha)
export galoy_pay=$(cat galoy_pay/commit_sha)
export dealer=$(cat dealer/commit_sha)

export admin_panel_release_tag=$(cat admin_panel/tag)
export galoy_pay_release_tag=$(cat galoy_pay/tag)
export dealer_release_tag=$(cat dealer/tag)

envsubst < meta-release/templates/README.md > meta-release/README.md
envsubst < meta-release/templates/release.yml > meta-release/release.yml

pushd meta-release
  git add README.md release.yml
  git status

  # Only commit if there are uncommitted staged files
  if ! git diff --cached --exit-code; then
    git commit -m "ci(release): publish new release"
  fi
popd

echo "README:"
echo "------------------------------------------"
cat meta-release/README.md
echo "------------------------------------------"
echo ""
echo "RELEASE:"
echo "------------------------------------------"
cat meta-release/release.yml
echo "------------------------------------------"
