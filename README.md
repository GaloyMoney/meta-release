# Galoy Meta Release 📦

This repository groups together the latest stable combination of the [Galoy stack](https://github.com/GaloyMoney/awesome-galoy#tech-components).
Releases to this repository happen after we complete testing out the individual components on staging and therefore should be good to go together with.

### Stable Release 🎉

The components we provide have been grouped into the following lifecycles, using the [charts](https://github.com/GaloyMoney/charts) and the [infra](https://github.com/GaloyMoney/galoy-infra) repository.
Source Code diff for the releases will be added soon.

#### Galoy Chart
- Galoy: Release galoy-v0.16.3 @ `10c51e73a7f2b8724f38944f4ad991f43c3d46e9` | [tree](https://github.com/GaloyMoney/charts/tree/10c51e73a7f2b8724f38944f4ad991f43c3d46e9/charts/galoy) | [release](https://github.com/GaloyMoney/charts/releases/tag/galoy-v0.16.3)

#### Stablesats Chart
- Stablesats: Release stablesats-v0.10.0 @ `bdd74037ad82b61317fef1eff5a35cf592cd30d5` | [tree](https://github.com/GaloyMoney/charts/tree/bdd74037ad82b61317fef1eff5a35cf592cd30d5/charts/stablesats) | [release](https://github.com/GaloyMoney/charts/releases/tag/stablesats-v0.10.0)

#### Bitcoin Charts
- Bitcoind: Release bitcoind-v0.2.19 @ `52f34d573b00c187bf1a2b2ed43c4a30cafc0f63` | [tree](https://github.com/GaloyMoney/charts/tree/52f34d573b00c187bf1a2b2ed43c4a30cafc0f63/charts/bitcoind) | [release](https://github.com/GaloyMoney/charts/releases/tag/bitcoind-v0.2.19)
- LND: Release lnd-v0.5.0 @ `dcac187e270a8156b17410c6412b84be01ecb9b7` | [tree](https://github.com/GaloyMoney/charts/tree/dcac187e270a8156b17410c6412b84be01ecb9b7/charts/lnd) | [release](https://github.com/GaloyMoney/charts/releases/tag/lnd-v0.5.0)
- RTL: Release rtl-v0.2.0 @ `cb856f8e3014d888e50871f18e64ab1ac151935a` | [tree](https://github.com/GaloyMoney/charts/tree/cb856f8e3014d888e50871f18e64ab1ac151935a/charts/rtl) | [release](https://github.com/GaloyMoney/charts/releases/tag/rtl-v0.2.0)
- Specter: Release specter-v0.3.1 @ `78e580c59d18753304a9995656a20c07df5978a2` | [tree](https://github.com/GaloyMoney/charts/tree/78e580c59d18753304a9995656a20c07df5978a2/charts/specter) | [release](https://github.com/GaloyMoney/charts/releases/tag/specter-v0.3.1)
- Bria: Release bria-v0.4.1 @ `9847620f3bb2ea59c65dbfef2ec3e16f4c24fe1f` | [tree](https://github.com/GaloyMoney/charts/tree/9847620f3bb2ea59c65dbfef2ec3e16f4c24fe1f/charts/bria) | [release](https://github.com/GaloyMoney/charts/releases/tag/bria-v0.4.1)
- Fulcrum: Release  @ `` | [tree](https://github.com/GaloyMoney/charts/tree//charts/fulcrum) | [release](https://github.com/GaloyMoney/charts/releases/tag/)

#### Monitoring Charts
- Monitoring: Release monitoring-v0.3.0 @ `dff9da3ccf8151568651320997db51dfb506a7d2` | [tree](https://github.com/GaloyMoney/charts/tree/dff9da3ccf8151568651320997db51dfb506a7d2/charts/monitoring) | [release](https://github.com/GaloyMoney/charts/releases/tag/monitoring-v0.3.0)

#### Addons Charts
- Galoy Pay: Release galoy-pay-v0.4.4 @ `69b82e97dd1a07c7d41837987615fb534e2ea267` | [tree](https://github.com/GaloyMoney/charts/tree/69b82e97dd1a07c7d41837987615fb534e2ea267/charts/galoy-pay) | [release](https://github.com/GaloyMoney/charts/releases/tag/galoy-pay-v0.4.4)
- Admin Panel: Release admin-panel-v0.2.15 @ `1cdac095efa4fb880f65c68ad851a4efc12a4795` | [tree](https://github.com/GaloyMoney/charts/tree/1cdac095efa4fb880f65c68ad851a4efc12a4795/charts/admin-panel) | [release](https://github.com/GaloyMoney/charts/releases/tag/admin-panel-v0.2.15)
- Dealer: Release dealer-v0.3.0 @ `f4cb983e0ce5026e30ed297ca1c4b394659ba439` | [tree](https://github.com/GaloyMoney/charts/tree/f4cb983e0ce5026e30ed297ca1c4b394659ba439/charts/dealer) | [release](https://github.com/GaloyMoney/charts/releases/tag/dealer-v0.3.0)
- Web Wallet: Release web-wallet-v0.3.0 @ `5d7580b96be0917da3e1c24669bc4a2feb193f2c` | [tree](https://github.com/GaloyMoney/charts/tree/5d7580b96be0917da3e1c24669bc4a2feb193f2c/charts/web-wallet) | [release](https://github.com/GaloyMoney/charts/releases/tag/web-wallet-v0.3.0)

#### Infra

- Galoy Infra: Release v0.11.6 @ `8e3386675ea24ed20fe435c93503c8dbce5b4165` | [tree](https://github.com/GaloyMoney/galoy-infra/tree/8e3386675ea24ed20fe435c93503c8dbce5b4165) | [release](https://github.com/GaloyMoney/galoy-infra/releases/tag/v0.11.6)

#### Galoy Mobile

- Galoy Mobile: Release beta-2.2.86 @ `bf11b0321e9cbb98c0881db10237bf12b3628f06` | [tree](https://github.com/GaloyMoney/galoy-mobile/tree/bf11b0321e9cbb98c0881db10237bf12b3628f06) | [release](https://github.com/GaloyMoney/galoy-mobile/releases/tag/beta-2.2.86)

If you would like to use this packaging info in a script, we publish this information in this [release.yml](./release.yml) and [release.json](./release.json) file.

#### Galoy Deps Chart
- Galoy Deps: Release galoy-deps-v0.3.1 @ `d9f5360039ea48629d5d9480b0f9587da6dfd476` | [tree](https://github.com/GaloyMoney/charts/tree/d9f5360039ea48629d5d9480b0f9587da6dfd476/charts/galoy-deps) | [release](https://github.com/GaloyMoney/charts/releases/tag/galoy-deps-v0.3.1)
