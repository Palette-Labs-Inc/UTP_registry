#!/bin/sh

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

NAME=$1
CALLBACK=$2
INDUSTRY=$3
OPERATE=$4
NKN=$5
LOCATION=$6


$CMD keys add $NAME;
source ${__dir}/feegrant/feegrant-create.sh $NAME
source ${__dir}/nride-token/token-send.sh faucet $NAME 1000
source ${__dir}/registry/registry-subscribe.sh $NAME $CALLBACK $INDUSTRY $OPERATE $NKN $LOCATION
