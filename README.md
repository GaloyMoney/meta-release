# Galoy Meta Release 📦

This repository groups together the latest stable combination of the [Galoy stack](https://github.com/GaloyMoney/awesome-galoy#tech-components).
Releases to this repository happen after we complete testing out the individual components on staging and therefore should be good to go together with.

### Stable Release 🎉

The components we provide have been grouped into the following lifecycles, using the [charts](https://github.com/GaloyMoney/charts) and the [infra](https://github.com/GaloyMoney/galoy-infra) repository.
Source Code diff for the releases will be added soon.

#### Galoy Chart
- Galoy: Release galoy-v0.11.18 @ `d4944986ed91a5f6d987638ceff220c56f0714dd` | [tree](https://github.com/GaloyMoney/charts/tree/d4944986ed91a5f6d987638ceff220c56f0714dd/charts/galoy) | [release](https://github.com/GaloyMoney/charts/releases/tag/galoy-v0.11.18)

#### Stablesats Chart
- Stablesats: Release stablesats-v0.9.11 @ `c20335b7f80426cb0d255cfad8b1c3afc3a3aee3` | [tree](https://github.com/GaloyMoney/charts/tree/c20335b7f80426cb0d255cfad8b1c3afc3a3aee3/charts/stablesats) | [release](https://github.com/GaloyMoney/charts/releases/tag/stablesats-v0.9.11)

#### Bitcoin Charts
- Bitcoind: Release bitcoind-v0.2.19 @ `52f34d573b00c187bf1a2b2ed43c4a30cafc0f63` | [tree](https://github.com/GaloyMoney/charts/tree/52f34d573b00c187bf1a2b2ed43c4a30cafc0f63/charts/bitcoind) | [release](https://github.com/GaloyMoney/charts/releases/tag/bitcoind-v0.2.19)
- LND: Release lnd-v0.4.14 @ `683ca957274ea019fcce581d114479c3507f38d9` | [tree](https://github.com/GaloyMoney/charts/tree/683ca957274ea019fcce581d114479c3507f38d9/charts/lnd) | [release](https://github.com/GaloyMoney/charts/releases/tag/lnd-v0.4.14)
- RTL: Release rtl-v0.1.16 @ `1629d8b1432ed420d37e3e0fa4bee18ca932cefe` | [tree](https://github.com/GaloyMoney/charts/tree/1629d8b1432ed420d37e3e0fa4bee18ca932cefe/charts/rtl) | [release](https://github.com/GaloyMoney/charts/releases/tag/rtl-v0.1.16)
- Specter: Release specter-v0.3.1 @ `78e580c59d18753304a9995656a20c07df5978a2` | [tree](https://github.com/GaloyMoney/charts/tree/78e580c59d18753304a9995656a20c07df5978a2/charts/specter) | [release](https://github.com/GaloyMoney/charts/releases/tag/specter-v0.3.1)
- Bria: Release bria-v0.2.15 @ `3c26ea39361a3b72e7ec454272e8f5dfe9ef941b` | [tree](https://github.com/GaloyMoney/charts/tree/3c26ea39361a3b72e7ec454272e8f5dfe9ef941b/charts/bria) | [release](https://github.com/GaloyMoney/charts/releases/tag/bria-v0.2.15)
- Fulcrum: Release  @ `` | [tree](https://github.com/GaloyMoney/charts/tree//charts/fulcrum) | [release](https://github.com/GaloyMoney/charts/releases/tag/)

#### Monitoring Charts
- Monitoring: Release monitoring-v0.1.57 @ `bfd22b35ea269d35d88f45a87f53bc9387961665` | [tree](https://github.com/GaloyMoney/charts/tree/bfd22b35ea269d35d88f45a87f53bc9387961665/charts/monitoring) | [release](https://github.com/GaloyMoney/charts/releases/tag/monitoring-v0.1.57)

#### Addons Charts
- Galoy Pay: Release galoy-pay-v0.4.3 @ `e4a68123fde42d642d2b3156546994defdd04c2b` | [tree](https://github.com/GaloyMoney/charts/tree/e4a68123fde42d642d2b3156546994defdd04c2b/charts/galoy-pay) | [release](https://github.com/GaloyMoney/charts/releases/tag/galoy-pay-v0.4.3)
- Admin Panel: Release admin-panel-v0.2.14 @ `8e3364c433b793d5ca516f9acaf61138e976276c` | [tree](https://github.com/GaloyMoney/charts/tree/8e3364c433b793d5ca516f9acaf61138e976276c/charts/admin-panel) | [release](https://github.com/GaloyMoney/charts/releases/tag/admin-panel-v0.2.14)
- Dealer: Release dealer-v0.1.38 @ `319a74ec5df036ce2a5ac8707661abf7cf8a7e71` | [tree](https://github.com/GaloyMoney/charts/tree/319a74ec5df036ce2a5ac8707661abf7cf8a7e71/charts/dealer) | [release](https://github.com/GaloyMoney/charts/releases/tag/dealer-v0.1.38)
- Web Wallet: Release web-wallet-v0.2.1 @ `85baf09c128de49c239c86e6a392638ac2a2bdd8` | [tree](https://github.com/GaloyMoney/charts/tree/85baf09c128de49c239c86e6a392638ac2a2bdd8/charts/web-wallet) | [release](https://github.com/GaloyMoney/charts/releases/tag/web-wallet-v0.2.1)

#### Infra

- Galoy Infra: Release v0.11.5 @ `7997873ea1b1d64dbda2f8823fcfedcbb0b77e7d` | [tree](https://github.com/GaloyMoney/galoy-infra/tree/7997873ea1b1d64dbda2f8823fcfedcbb0b77e7d) | [release](https://github.com/GaloyMoney/galoy-infra/releases/tag/v0.11.5)

#### Galoy Mobile

- Galoy Mobile: Release beta-2.2.68 @ `b6bdb91579f7f089dfea8750e1565035d8cc9a05` | [tree](https://github.com/GaloyMoney/galoy-mobile/tree/b6bdb91579f7f089dfea8750e1565035d8cc9a05) | [release](https://github.com/GaloyMoney/galoy-mobile/releases/tag/beta-2.2.68)

If you would like to use this packaging info in a script, we publish this information in this [release.yml](./release.yml) and [release.json](./release.json) file.

#### Galoy Deps Chart
- Galoy Deps: Release galoy-deps-v0.1.28 @ `6c99b3ff2a9a856020d82aecc8ee7265167e696e` | [tree](https://github.com/GaloyMoney/charts/tree/6c99b3ff2a9a856020d82aecc8ee7265167e696e/charts/galoy-deps) | [release](https://github.com/GaloyMoney/charts/releases/tag/galoy-deps-v0.1.28)
