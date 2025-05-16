#!/bin/bash

source vars.env

SYSTEM_DID_NAME="system1"
SYSTEM_DID_URL="https://system1.com"

NAME=$1
ROLE=$2

RES=$(curl --silent -X 'POST' \
  "$CHEQD_STUDIO_ENDPOINT"'/did/create' \
  -H 'accept: application/json' \
  -H 'x-api-key: '"$CHEQD_STUDIO_API_KEY" \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'network=testnet&identifierFormatType=uuid&verificationMethodType=Ed25519VerificationKey2018&service=%5B%7B%22idFragment%22%3A%22system1%22%2C%22type%22%3A%22LinkedDomains%22%2C%22serviceEndpoint%22%3A%5B%22https%3A%2F%2Fsystem1.com%22%5D%7D%5D&key=&%40context=https%3A%2F%2Fwww.w3.org%2Fns%2Fdid%2Fv1')

DID=$(jq -r '.did' <<< "$RES")

echo $DID