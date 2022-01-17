# Galoy Meta Release 📦

This repository groups together the latest stable combination of the [Galoy stack](https://github.com/GaloyMoney/awesome-galoy#tech-components). 
Releases to this repository happen after we complete testing out the individual components on staging and therefore should be good to go together with.

### Stable Release 🎉

The components we provide have been grouped into the following lifecycles, using the [charts](https://github.com/GaloyMoney/charts) and the [infra](https://github.com/GaloyMoney/galoy-infra) repository. 
Source Code diff for the releases will be added soon.

#### Galoy Charts
- [Galoy](https://github.com/GaloyMoney/charts/tree/${bitcoind}/charts/galoy): `${galoy}` | [link](https://github.com/GaloyMoney/charts/tree/${galoy})

#### Bitcoin Charts
- [Bitcoind](https://github.com/GaloyMoney/charts/tree/${bitcoind}/charts/bitcoind): `${bitcoind}` | [link](https://github.com/GaloyMoney/charts/tree/${bitcoind})
- [LND](https://github.com/GaloyMoney/charts/tree/${lnd}/charts/lnd): `${lnd}` | [link](https://github.com/GaloyMoney/charts/tree/${lnd})
- [RTL](https://github.com/GaloyMoney/charts/tree/${rtl}/charts/rtl): `${rtl}` | [link](https://github.com/GaloyMoney/charts/tree/${rtl})
- [Specter](https://github.com/GaloyMoney/charts/tree/${specter}/charts/specter): `${specter}` | [link](https://github.com/GaloyMoney/charts/tree/${specter})

#### Monitoring Charts
- [Monitoring](https://github.com/GaloyMoney/charts/tree/${monitoring}/charts/monitoring): `${monitoring}` | [link](https://github.com/GaloyMoney/charts/tree/${monitoring})
- [LNDMon](https://github.com/GaloyMoney/charts/tree/${lndmon}/charts/lnd/charts/lndmon): `${lndmon}` | [link](https://github.com/GaloyMoney/charts/tree/${lndmon})

#### Addons Charts
- [Galoy Pay](https://github.com/GaloyMoney/charts/tree/${galoy_pay}/charts/galoy-pay): `${galoy_pay}` | [link](https://github.com/GaloyMoney/charts/tree/${galoy_pay})
- [Admin Panel](https://github.com/GaloyMoney/charts/tree/${admin_panel}/charts/admin-panel): `${admin_panel}` | [link](https://github.com/GaloyMoney/charts/tree/${admin_panel})
- [Dealer](https://github.com/GaloyMoney/charts/tree/${dealer}/charts/dealer): `${dealer}` | [link](https://github.com/GaloyMoney/charts/tree/${dealer})

#### Infra

- Galoy Infra: Release ${infra_release_tag} @ `${infra}` | [tree](https://github.com/GaloyMoney/galoy-infra/tree/${infra}) | [release](https://github.com/GaloyMoney/galoy-infra/releases/tag/${infra_release_tag})

If you would like to use this packaging info in a script, we publish this information in this [release.yml](./release.yml) file.
