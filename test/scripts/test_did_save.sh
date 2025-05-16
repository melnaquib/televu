#!/bin/bash

source ../../.env
source ./vars.env

NAME=$1
ROLE=$2
DID=$3

redis-cli SET $DID \
  '{"did": "'$DID'", "name": "'$NAME'",  "role": "'$ROLE'", "VCsIssuer": [], "VCsSubhect": []}'
redis-cli SET $NAME \
  '{"did": "'$DID'", "name": "'$NAME'",  "role": "'$ROLE'", "VCsIssuer": [], "VCsSubhect": []}'
