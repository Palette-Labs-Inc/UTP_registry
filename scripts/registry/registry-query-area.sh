#!/bin/sh

$CMD query wasm contract-state smart $REGISTRY \
'{"area":{"coordinate":"'"$1"'"}}' \
--node $NODE
