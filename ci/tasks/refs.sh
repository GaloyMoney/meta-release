#!/bin/bash

set -eu

# Galoy
export galoy=$(yq e '.galoy' meta-release/release.yml)

# Infra
export infra=$(yq e '.infra.commit' meta-release/release.yml)

# Bitcoind
export bitcoind=$(yq e '.bitcoind' meta-release/release.yml)
export lnd=$(yq e '.lnd' meta-release/release.yml)
export rtl=$(yq e '.rtl' meta-release/release.yml)
export specter=$(yq e '.specter' meta-release/release.yml)

# Monitoring
export monitoring=$(yq e '.monitoring' meta-release/release.yml)
export lndmon=$(yq e '.lndmon' meta-release/release.yml)

# Addons
export admin_panel=$(yq e '.admin_panel' meta-release/release.yml)
export galoy_pay=$(yq e '.galoy_pay' meta-release/release.yml)
export dealer=$(yq e '.dealer' meta-release/release.yml)
