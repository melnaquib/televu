import json
import orthanc
import pprint
import did

def doctor_allowed(answer, doctor):
    return doctor in ['CHARLES']

def OnFindReq(answers, query, issuerAet, calledAet):
    print('Received incoming C-FIND request from %s:' % issuerAet)
    retrun

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
