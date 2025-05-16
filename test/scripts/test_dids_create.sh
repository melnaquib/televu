#!/bin/bash

source ../../.env
source ./vars.env

# sudo apt install curl jq dcmtk python3-hl7 redis-tools

PATIENT_01_DID=did:cheqd:testnet:5e26c4f5-7400-472b-b9f2-c778414a05a3
PATIENT_02_DID=did:cheqd:testnet:ce293f1d-1848-4e57-aa93-3b122e60de50
DOCTOR_01_DID=did:cheqd:testnet:990cd443-8c20-4c10-bdb8-4126920e8fba
DOCTOR_02_DID=did:cheqd:testnet:98d78875-659e-4136-9c39-6a9fc78eb637

# TODO: skip if already created
return

echo "System: Create DID for"
PATIENT_01_DID=$(./system_did_create.sh $PATIENT_01_NAME patient)
echo "$PATIENT_01_NAME AS patient : $PATIENT_01_DID"
PATIENT_02_DID=$(./system_did_create.sh $PATIENT_02_NAME patient)
echo "$PATIENT_02_NAME AS patient : $PATIENT_02_DID"

DOCTOR_01_DID=$(./system_did_create.sh $DOCTOR_01_NAME doctor)
echo "$DOCTOR_01_NAME AS patient : $DOCTOR_01_DID"
DOCTOR_02_DID=$(./system_did_create.sh $DOCTOR_02_NAME doctor)
echo "$DOCTOR_02_NAME AS patient : $DOCTOR_02_DID"
