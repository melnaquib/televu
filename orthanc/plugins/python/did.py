import redis
import jwt

def validate_vc(doctor_did, patient_did, jwt_token_str):
    jwt_token = jwt.decode(jwt_token, options={"verify_signature": False})
    print("jwt_token")
    print(jwt_token)
    return True

def doctor_has_vc(doctor_name, patient_did):
    r = redis.Redis(host='localhost', port=6379, db=0)
    doctor = r.get(doctor_name)
    vcs = doctor.VCsSubject
    res = any(lambda vc: validate_vc(doctor.did, patient_did, vc), vcs)
    return res
