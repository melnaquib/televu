#!/bin/bash

source vars.env

SYSTEM_DID_NAME="system1"
SYSTEM_DID_URL="https://system1.com"

PATIENT_DID=$1
DOCTOR_DID=$2

RSP=$(curl --silent -X 'POST' \
  'https://studio-api.cheqd.net/credential/issue' \
  -H 'accept: application/json' \
  -H 'x-api-key: caas_003add52e0f86af4de4bb56ce02dd580cb08cd76addaedb88b93205e83f5286fc77be7c6200748691c9fa1288876d8a52b31a0eea9cf011a84f1424bc40b39ae' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d "issuerDid=$PATIENT_DID" \
  -d 'termsOfUse=%7B%22type%22%3A%22hipaa%22%7D&credentialStatus=' \
  -d "subjectDid=$DOCTOR_DID" \
  -d '&attributes=%7B%22type%22%3A%22Study%22%2C%22study_iuid%22%3A%22%22%7D&evidence=&format=jwt&type=Study&refreshService=&expirationDate='
  )

JWT=$(jq -r '.proof.jwt' <<< "$RSP")

echo $JWT
