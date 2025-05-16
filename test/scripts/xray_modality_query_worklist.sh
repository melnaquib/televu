#!/bin/bash

source ../../.env
source ./vars.env

AET=XRAY1
AEC=$PACS_AET
HOST=127.0.0.1
PORT=$PACS_PORT

#findscu -v -W -aet DCMTK -aec $AEC $HOST $PORT -k 0010,0010
echo findscu -v -W -aet $AET -aec $AEC $HOST $PORT \
-k PatientName -k PatientID \
-k Modality \
-k ScheduledProcedureStepSequence[0].ScheduledStationAETitle=""
