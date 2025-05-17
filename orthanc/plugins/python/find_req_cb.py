import json
import orthanc
import pprint
import did

def doctor_allowed(answer, doctor):
    return doctor in ['CHARLES']

def onFindReq(answers, query, issuerAet, calledAet):
    print('Received incoming C-FIND request from %s:' % issuerAet)
    print("answers")
    print(answers)
    print(dir(answers))
    return

    answers = list(filter(lambda answer: doctor_allowed(answer, issuerAet), answers))
    # res = FindAnswers(answers, query, issuerAet, calledAet)

    answer = {}
    for i in range(query.GetFindQuerySize()):
        print('  %s (%04x,%04x) = [%s]' % (query.GetFindQueryTagName(i),
                                           query.GetFindQueryTagGroup(i),
                                           query.GetFindQueryTagElement(i),
                                           query.GetFindQueryValue(i)))
        answer[query.GetFindQueryTagName(i)] = ('HELLO%d-%s' % (i, query.GetFindQueryValue(i)))

    answers.FindAddAnswer(orthanc.CreateDicom(
        json.dumps(answer), None, orthanc.CreateDicomFlags.NONE))

    # To indicate a failure in the processing, one can raise an exception:
    #   raise Exception('Cannot handle C-MOVE')


def onMove(**request):
    study_iuid = request["StudyInstanceUID"]
    patient_id = request["PatientID"]
    doctor = request["OriginatorAET"]

    if not did.doctor_has_vc(doctor, patient_id):
        raise Exception('No Valid VC for doctor %s, patient %s' % (doctor, patient_id))


    orthanc.LogWarning('C-MOVE: %s' % json.dumps(
        request, indent = 4, sort_keys = True))
