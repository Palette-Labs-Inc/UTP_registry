#!/bin/sh

$CMD query wasm contract-state smart $REGISTRY \
'{"all":{}}' \
--node $NODE
