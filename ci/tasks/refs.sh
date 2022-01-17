#!/bin/bash

set -eu

# Galoy
export galoy=$(yq e '.galoy' repo/release.yml)

# Infra
export infra=$(yq e '.infra.commit' repo/release.yml)

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
