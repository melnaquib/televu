from pydantic import BaseModel
from datetime import datetime
from typing import Optional

class ExamCreate(BaseModel):
    patient_name: str
    modality_id: int
    scheduled_date: datetime
    radiologist_id: Optional[int] = None
    operator_id: Optional[int] = None
    notes: Optional[str] = None

class ExamResponse(ExamCreate):
    id: int 