#!/bin/bash

source ../../.env
source ./vars.env

NAME=$1
DID=$2

ACCESSION_NUMBER=$(echo $DID | md5sum | tr -d ' -')

#__PATIENT_ID__
#__PATIENT_NAME__
#__ACCESSION_NUMBER__

FILENAME=$ACCESSION_NUMBER.hl7.tmp

cat orm_o01.hl7 | sed \
-e 's/__PATIENT_NAME__/'$NAME'/' \
-e 's/__ACCESSION_NUMBER__/'$ACCESSION_NUMBER'/' \
-e 's/__PATIENT_ID__/'$DID'/' > $ACCESSION_NUMBER.hl7.tmp

mllp_send --loose -f $FILENAME -p $PACS_MWL_PORT $PACS_HOST
