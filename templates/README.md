# Galoy Meta Release 📦

This repository groups together the latest stable combination of the [Galoy stack](https://github.com/GaloyMoney/awesome-galoy#tech-components). 
Releases to this repository happen after we complete testing out the individual components on staging and therefore should be good to go together with.

### Stable Release 🎉

The components we provide have been grouped into the following lifecycles, using the [charts](https://github.com/GaloyMoney/charts) and the [infra](https://github.com/GaloyMoney/galoy-infra) repository. 
Source Code diff for the releases will be added soon.

#### Galoy Chart
- Galoy: Release ${galoy_release_tag} @ `${galoy}` | [tree](https://github.com/GaloyMoney/charts/tree/${galoy}/charts/galoy) | [release](https://github.com/GaloyMoney/charts/releases/tag/${galoy_release_tag})

#### Stablesats Chart
- Stablesats: Release ${stablesats_release_tag} @ `${stablesats}` | [tree](https://github.com/GaloyMoney/charts/tree/${stablesats}/charts/stablesats) | [release](https://github.com/GaloyMoney/charts/releases/tag/${stablesats_release_tag})

#### Bitcoin Charts
- Bitcoind: Release ${bitcoind_release_tag} @ `${bitcoind}` | [tree](https://github.com/GaloyMoney/charts/tree/${bitcoind}/charts/bitcoind) | [release](https://github.com/GaloyMoney/charts/releases/tag/${bitcoind_release_tag})
- LND: Release ${lnd_release_tag} @ `${lnd}` | [tree](https://github.com/GaloyMoney/charts/tree/${lnd}/charts/lnd) | [release](https://github.com/GaloyMoney/charts/releases/tag/${lnd_release_tag})
- RTL: Release ${rtl_release_tag} @ `${rtl}` | [tree](https://github.com/GaloyMoney/charts/tree/${rtl}/charts/rtl) | [release](https://github.com/GaloyMoney/charts/releases/tag/${rtl_release_tag})
- Specter: Release ${specter_release_tag} @ `${specter}` | [tree](https://github.com/GaloyMoney/charts/tree/${specter}/charts/specter) | [release](https://github.com/GaloyMoney/charts/releases/tag/${specter_release_tag})

#### Monitoring Charts
- Monitoring: Release ${monitoring_release_tag} @ `${monitoring}` | [tree](https://github.com/GaloyMoney/charts/tree/${monitoring}/charts/monitoring) | [release](https://github.com/GaloyMoney/charts/releases/tag/${monitoring_release_tag})

#### Addons Charts
- Galoy Pay: Release ${galoy_pay_release_tag} @ `${galoy_pay}` | [tree](https://github.com/GaloyMoney/charts/tree/${galoy_pay}/charts/galoy-pay) | [release](https://github.com/GaloyMoney/charts/releases/tag/${galoy_pay_release_tag})
- Admin Panel: Release ${admin_panel_release_tag} @ `${admin_panel}` | [tree](https://github.com/GaloyMoney/charts/tree/${admin_panel}/charts/admin-panel) | [release](https://github.com/GaloyMoney/charts/releases/tag/${admin_panel_release_tag})
- Dealer: Release ${dealer_release_tag} @ `${dealer}` | [tree](https://github.com/GaloyMoney/charts/tree/${dealer}/charts/dealer) | [release](https://github.com/GaloyMoney/charts/releases/tag/${dealer_release_tag})
- Web Wallet: Release ${web_wallet_release_tag} @ `${web_wallet}` | [tree](https://github.com/GaloyMoney/charts/tree/${web_wallet}/charts/web_wallet) | [release](https://github.com/GaloyMoney/charts/releases/tag/${web_wallet_release_tag})

#### Infra

- Galoy Infra: Release ${infra_release_tag} @ `${infra}` | [tree](https://github.com/GaloyMoney/galoy-infra/tree/${infra}) | [release](https://github.com/GaloyMoney/galoy-infra/releases/tag/${infra_release_tag})

#### Galoy Mobile

- Galoy Mobile: Release ${galoy_mobile_release_tag} @ `${galoy_mobile}` | [tree](https://github.com/GaloyMoney/galoy-mobile/tree/${galoy_mobile}) | [release](https://github.com/GaloyMoney/galoy-mobile/releases/tag/${galoy_mobile_release_tag})

If you would like to use this packaging info in a script, we publish this information in this [release.yml](./release.yml) file.
