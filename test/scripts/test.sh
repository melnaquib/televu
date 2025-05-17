#!/bin/bash

source ../../.env
source ./vars.env

# sudo apt install curl jq dcmtk python3-hl7 redis-tools

echo "1- System: DID Create"
source ./test_dids_create.sh

echo "2- RIS: Send radiology order"
./ris_mwl_send_order.sh $PATIENT_01_NAME $PATIENT_01_DID
./ris_mwl_send_order.sh $PATIENT_02_NAME $PATIENT_02_DID

echo "3- XRay Modality: Query Modality Worklist"
./xray_modality_query_worklist.sh

echo "4- XRay Modality: Send Studies to PACS"
./xray_modality_send_study.sh $PATIENT_01_NAME $PATIENT_01_DID 01.DCM
./xray_modality_send_study.sh $PATIENT_02_NAME $PATIENT_02_DID 02.DCM

echo "5- Test Scenario: 1"

echo "6- Test Scenario: Patient: Patient $PATIENT_01_NAME Grant Doctor $DOCTOR_01_NAME access to Study"
JWT_01_01=./ris_grant_access.sh $PATIENT_01_DID $DOCTOR_01_DID
./test_doctor_save_vc.sh $DOCTOR_01_NAME $DOCTOR_01_DID "[$JWT_01_01]"

echo "7- DICOM Viewer: Query PACS for Studies that doctor $DOCTOR_01_NAME can see!"
./dicom_viewer_cmove_study.sh $DOCTOR_01_NAME

exit 0

# recommend to manually grant access to doctor 02 and examine change with dicom viewer
echo "8- Test Scenario: 2"

echo "9- Test Scenario: Patient: Patient $PATIENT_01_NAME Grant Doctor $DOCTOR_01_NAME access to Study"
JWT_01_02=./ris_grant_access.sh $PATIENT_01_DID $DOCTOR_02_DID
JWT_02_02=./ris_grant_access.sh $PATIENT_02_DID $DOCTOR_02_DID
./test_doctor_save_vc.sh scenario1dir $DOCTOR_02_NAME $DOCTOR_02_DID "[$JWT_01_02, $JWT_02_02]"

echo "10- DICOM Viewer: Query PACS for Studies that doctor $DOCTOR_01_NAME can see!"
./dicom_viewer_cmove_study.sh scenario2dir $DOCTOR_02_NAME
