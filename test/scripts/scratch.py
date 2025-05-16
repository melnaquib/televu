import hl7
from hl7 import __version__ as hl7_version
from hl7.client import CR, EB, SB, MLLPClient, MLLPException, mllp_send

with MLLPClient("localhost", 6379) as client:
    buffer = open("z.hl7", "rb").read()
    msg = hl7.parse(buffer)
    client.send_message(msg)
    client.close()