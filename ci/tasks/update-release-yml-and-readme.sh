#!/bin/bash

set -eu

# Galoy
export galoy=$(cat galoy/commit_sha)
export galoy_release_tag=$(cat galoy/tag)

# Cala
export cala=$(cat cala/commit_sha)
export cala_release_tag=$(cat cala/tag)

# Stablesats
export stablesats=$(cat stablesats/commit_sha)
export stablesats_release_tag=$(cat stablesats/tag)

# Infra
export infra=$(cat infra/commit_sha)
export infra_release_tag=$(cat infra/tag)

# Bitcoin
export bitcoind=$(cat bitcoind/commit_sha)
export lnd=$(cat lnd/commit_sha)
export rtl=$(cat rtl/commit_sha)
export specter=$(cat specter/commit_sha)
export bria=$(cat bria/commit_sha)

export bitcoind_release_tag=$(cat bitcoind/tag)
export lnd_release_tag=$(cat lnd/tag)
export rtl_release_tag=$(cat rtl/tag)
export specter_release_tag=$(cat specter/tag)
export bria_release_tag=$(cat bria/tag)

# Monitoring
export monitoring=$(cat monitoring/commit_sha)
export monitoring_release_tag=$(cat monitoring/tag)

# Addons
export admin_panel=$(cat admin-panel/commit_sha)
export galoy_pay=$(cat galoy-pay/commit_sha)

export admin_panel_release_tag=$(cat admin-panel/tag)
export galoy_pay_release_tag=$(cat galoy-pay/tag)

# Mobile
export galoy_mobile=$(cat galoy-mobile/commit_sha)
export galoy_mobile_release_tag=$(cat galoy-mobile/tag)

# Galoy Deps
export galoy_deps=$(cat galoy-deps/commit_sha)
export galoy_deps_release_tag=$(cat galoy-deps/tag)

envsubst < meta-release/templates/README.md > meta-release/README.md
envsubst < meta-release/templates/release.yml > meta-release/release.yml
envsubst < meta-release/templates/release.json > meta-release/release.json

pushd meta-release
  git add README.md release.yml release.json
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
echo "RELEASE YAML:"
echo "------------------------------------------"
cat meta-release/release.yml
echo "------------------------------------------"
echo "RELEASE JSON:"
echo "------------------------------------------"
cat meta-release/release.json
echo "------------------------------------------"
