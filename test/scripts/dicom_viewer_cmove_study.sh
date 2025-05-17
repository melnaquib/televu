#!/bin/bash

source ../../.env
source testvars.env

DOCTOR=CHARLES
# DOCTOR=$1

AET=$DOCTOR
AEC=$PACS_AET
HOST=127.0.0.1
PORT=$PACS_PORT

echo cmove -v -S -aet $AET -aec $AEC $HOST $PORT \
-k QueryRetrieveLevel=STUDY \
-k StudyInstanceUID
