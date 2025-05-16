import json
import orthanc

def onWorklistReq(query, originatorAet, originatorIp, originatorPort, calledAet, calledIp, calledPort):
    """
    This callback is called whenever a Modality Worklist (MWL) query is received.
    
    Args:
        query: The worklist query as a dictionary
        originatorAet: The AE Title of the querying client
        originatorIp: The IP address of the querying client
        originatorPort: The port of the querying client
        calledAet: The AE Title of this server
        calledIp: The IP address of this server
        calledPort: The port of this server
    """
    print(f"Modality Worklist Query received:")
    print(f"Query: {json.dumps(query, indent=2)}")
    print(f"From: {originatorAet} ({originatorIp}:{originatorPort})")
    print(f"To: {calledAet} ({calledIp}:{calledPort})")
