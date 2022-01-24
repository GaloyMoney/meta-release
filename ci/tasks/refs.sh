#!/bin/bash

set -eu

# Galoy
export galoy=$(yq e '.galoy.commit' meta-release/release.yml)
export galoy_release_tag=$(yq e '.galoy.release_tag' meta-release/release.yml)

# Infra
export infra=$(yq e '.infra.commit' meta-release/release.yml)
export infra_release_tag=$(yq e '.infra.release_tag' meta-release/release.yml)

# Bitcoind
export bitcoind=$(yq e '.bitcoind.commit' meta-release/release.yml)
export lnd=$(yq e '.lnd.commit' meta-release/release.yml)
export rtl=$(yq e '.rtl.commit' meta-release/release.yml)
export specter=$(yq e '.specter.commit' meta-release/release.yml)

export bitcoind_release_tag=$(yq e '.bitcoind.release_tag' meta-release/release.yml)
export lnd_release_tag=$(yq e '.lnd.release_tag' meta-release/release.yml)
export rtl_release_tag=$(yq e '.rtl.release_tag' meta-release/release.yml)
export specter_release_tag=$(yq e '.specter.release_tag' meta-release/release.yml)

# Monitoring
export monitoring=$(yq e '.monitoring.commit' meta-release/release.yml)
export lndmon=$(yq e '.lndmon.commit' meta-release/release.yml)

export monitoring_release_tag=$(yq e '.monitoring.release_tag' meta-release/release.yml)
export lndmon_release_tag=$(yq e '.lndmon.release_tag' meta-release/release.yml)

# Addons
export admin_panel=$(yq e '.admin_panel.commit' meta-release/release.yml)
export galoy_pay=$(yq e '.galoy_pay.commit' meta-release/release.yml)
export dealer=$(yq e '.dealer.commit' meta-release/release.yml)

export admin_panel_release_tag=$(yq e '.admin_panel.release_tag' meta-release/release.yml)
export galoy_pay_release_tag=$(yq e '.galoy_pay.release_tag' meta-release/release.yml)
export dealer_release_tag=$(yq e '.dealer.release_tag' meta-release/release.yml)
