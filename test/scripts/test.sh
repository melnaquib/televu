#!/bin/bash

source ../../.env
source ./vars.env

# sudo apt install curl jq dcmtk python3-hl7 redis-tools

echo "System: DID Create"

source ./test_dids_create.sh

# ./test_save_did.sh $PATIENT_01_NAME patient $PATIENT_01_DID
# ./test_save_did.sh $PATIENT_02_NAME patient $PATIENT_02_DID
# ./test_save_did.sh $DOCTOR_01_NAME doctor $DOCTOR_01_DID
# ./test_save_did.sh $DOCTOR_02_NAME doctor $DOCTOR_02_DID

echo "RIS: Send radiology order"
./ris_mwl_send_order.sh $PATIENT_01_NAME $PATIENT_01_DID
./ris_mwl_send_order.sh $PATIENT_02_NAME $PATIENT_02_DID
exit

echo "XRay Modality: Query Modality Worklist"
./xray_modality_query_worklist.sh

exit 0

echo "XRay Modality: Create And Send Study for Patients"
./xray_modality_create_and_send_study.sh $PATIENT_01_NAME $PATIENT_01_DID
./xray_modality_create_and_send_study.sh $PATIENT_02_NAME $PATIENT_02_DID

echo "RIS: Grant Doctor $DOCTOR_01_NAME access to Study of patient $PATIENT_01_NAME"
./ris_grant_access.sh $PATIENT_01_DID $DOCTOR_01_DID

echo "DICOM Viewer: Query PACS for Studies that doctor $DOCTOR_01_NAME can see!"
./dicom_viewer_query_pacs.sh $DOCTOR_01_NAME

exit 0

echo "RIS: Grant Doctor $DOCTOR_01_NAME access to Study of patient $PATIENT_02_NAME"
./ris_grant_access.sh $PATIENT_02_DID $DOCTOR_01_DID

echo "RIS: Grant Doctor $DOCTOR_02_NAME access to Study of patient $PATIENT_02_NAME"
./ris_grant_access.sh $PATIENT_02_DID $DOCTOR_02_DID

echo "DICOM Viewer: Query PACS for Studies that doctor $DOCTOR_01_NAME can see!"
./dicom_viewer_query_pacs.sh $DOCTOR_01_NAME

echo "DICOM Viewer: Query PACS for Studies that doctor $DOCTOR_02_NAME can see!"
./dicom_viewer_query_pacs.sh $DOCTOR_02_NAME
