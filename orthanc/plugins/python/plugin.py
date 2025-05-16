import json
import orthanc
import pydicom

# Import all callbacks
from find_req_cb import OnFindReq
from mwl_req_cb import onWorklistReq

# def OnStoredInstance(dicom, instanceId):
#     """
#     This callback is called whenever a new DICOM instance is stored in Orthanc.
#     """
#     print(f"New instance stored: {instanceId}")
    
#     # Get the instance information
#     instance = orthanc.GetInstance(instanceId)
#     print(f"Instance information: {json.dumps(instance, indent=2)}")

# # Register the callback
# orthanc.RegisterOnStoredInstanceCallback(OnStoredInstance)

# def OnChange(changeType, level, resource):
#     """
#     This callback is called whenever a change occurs in Orthanc.
#     """
#     print(f"Change detected - Type: {changeType}, Level: {level}, Resource: {resource}")

# orthanc.RegisterOnChangeCallback(OnChange)
orthanc.RegisterFindCallback(onFindReq)
# orthanc.RegisterMoveCallback(OnMove)
orthanc.RegisterWorklistCallback(onWorklistReq)

print("Python plugin loaded successfully!") 