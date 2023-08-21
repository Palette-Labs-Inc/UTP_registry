# UTP_registry
This repo is built based on rRide smart contracts(https://github.com/nride/nride-sc). It implements the registry infrastructure for the universal transaction protocol. The Registry Infrastructure stores identity, industry, and coverage information about Node operators.

## Overview
### Node operators
Node operators are businesses, non-profits, foundations, individuals, application developers, academic institutions, or other entities that host, store, and serve user data for the network. Node operators can represent and service one or many sides of the network's user's and are represented by a network-defined code accordingly.
- Universal Node Operators support the seller, buyer, and courier sides of the network and are defined by the three letter enumerated string ***UNO***
- Buyer Supporting Node Operators support the buyer side of the network and are defined by the three letter enumerated string ***BSN***
- Seller Supporting Node Operators support the seller side of the network and are defined by the three letter enumerated string ***SSN***
- Courier Supporting Node Operators support the courier side of the network and are defined by the three letter enumerated string ***CSN***

### Table
Once all checks are passed, the Registrar creates an entry for the participant on the Registry with the status as VERIFIED. Below is an example of the table.

|   reg_address     |   name      |         callbackUrl          | servicable_polygon | industry_code |    operate_type
|---------------------------------------------|-------------|----------------------------------------|-------------------|---------------|-------------|
| juno1kjz5h8nehk5nv39fnmrv9qj30hrnhurndlm85t|    Nosh     | https://noshdelivery.xyz |   `[[lat,lng],[lat,lng],...]`    |     FOOD      | UNO |
| juno1ch6pl9ltd34eykkufj8qdypffdheesvu5ztyla|    RocketRides     | https://rocketrides.xyz |   `[[lat,lng],[lat,lng],...]`    |     RIDES      | CSN |
| juno1v4pr6vtuhyq3g0ujpzjqgjzgjhjawtmc8c0968|  Drivers Coop  | https://drivers.coop  |   `[[lat,lng],[lat,lng],...]`    |     RIDES      | CSN |
| juno14sue7wvl0zzvyz3u3gw9dvyhj6j6f2vw79m5dh|    SnackAttack     | https://snackattack.xyz |   `[[lat,lng],[lat,lng],...]`    |     FOOD      | BSN |
| juno1k8dnnd39hl938hjgst65sv0np4lnfs6k0fggl5|    Boulder Local     | https://boulderlocal.org |   `[[lat,lng],[lat,lng],...]`    |     RIDES      | CSN |

## Token

Same as nride project, we also used `CW20` Token.

This repo uses a git submodule to track the official specs and implementations of the CW20 standard, as well as its dependencies, in the upstream repo `cw-plus`.

To compile:

```sh
make compile-cw20
```

## Prerequisites

1. Install the junod CLI (v10.0.2): 
https://docs.junonetwork.io/validators/getting-setup#build-juno-from-source

2. Install Docker

3. compile the smart contracts.

Note: this can take a long time

```sh
make compile-cw20
make compile-registry
```

4. for local users, create public key for `faucet`
```
junod keys add faucet
```

for testnet environment, request testnet tokens for the `faucet` account by writing a message in Juno's faucet channel: 
https://discord.com/channels/816256689078403103/842073995059003422

## Smart Contract Depolyment

#### Start local node (by default on localhost:26657)
```
make start-node
```

#### Stop local node 
```
make stop-node
```

#### Deploy and init smart contracts
```
make bootstrap
```

#### Register a new record
```
make add-new-user name=test callback=test.org industry=FOOD operate=UNO nkn=blahblahblah location="[[40.56334,-74.88527],[40.29154,-74.81935],[40.30411,-74.4568],[40.47147,-74.50624]]"
```
Note: no space in the polygon string
#### Query all registered records
```
make registry-all
```

#### Query individual registry record
```
make registry-details addr=$(junod keys show -a alice)
```
Note: alice could be replace by any name existing in the blockchain

#### Query nearby services (given a location coordinate, return services that covers the location)
```
make registry-query-area coordinate="[40.34599,-74.6985]"
```
Note: no space in the coordinate








