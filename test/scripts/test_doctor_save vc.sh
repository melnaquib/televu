#!/bin/bash

source ../../.env
source ./vars.env

DID=$1
NAME=$2
VCS=$3

redis-cli SET $NAME \
  '{"did": "'$DID'", "name": "'$NAME'",  "role": "doctor", "VCsIssuer": [], "VCsSubject": ['$VCS']}'
