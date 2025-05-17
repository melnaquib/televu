#!/bin/bash

source ../../.env
source ./vars.env

AET=XRAY1
AEC=$PACS_AET
HOST=127.0.0.1
PORT=$PACS_PORT

PATIENT_NAME=$1
PATIENT_DID=$2
INFILE=$3


cat $INFILE | \
modify -m "PatientName=$PATIENT_NAME" -m PatientID=$PATIENT_DID - | \
dcmsend -aet $AET -aec $AEC $HOST $PORT -
