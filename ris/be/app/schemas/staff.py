from pydantic import BaseModel
from typing import List

class Radiologist(BaseModel):
    id: int
    name: str
    specialties: List[str]

class Operator(BaseModel):
    id: int
    name: str
    equipment: List[str] 