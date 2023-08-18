#!/bin/sh

FROM=$1
CALLBACK=$2
INDUSTRY=$3
OPERATE=$4
NKN=$5
LOCATION=$6

$CMD tx wasm execute $REGISTRY \
'{"subscribe":{"name": "'"$FROM"'", "callback_url": "'"$CALLBACK"'", "industry_code": "'"$INDUSTRY"'", "operate_type": "'"$OPERATE"'", "nkn_addr": "'"$NKN"'", "location": "'"$LOCATION"'"}}' \
--from $FROM \
--fee-account $($CMD keys show -a faucet) \
--gas auto \
--gas-adjustment 1.3 \
--gas-prices 0.1$FEETOKEN \
--chain-id $CHAINID \
--node $NODE \
-b block \
-y
