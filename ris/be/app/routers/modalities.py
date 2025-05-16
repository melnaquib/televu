from fastapi import APIRouter, HTTPException
from typing import List
from ..schemas.staff import Radiologist, Operator

router = APIRouter()

# In-memory storage for demo purposes
# In production, use a proper database
radiologists_db = [
    {
        "id": 1,
        "name": "Dr. John Smith",
        "specialties": ["MRI", "CT", "X-Ray"]
    },
    {
        "id": 2,
        "name": "Dr. Sarah Johnson",
        "specialties": ["Ultrasound", "MRI"]
    }
]

operators_db = [
    {
        "id": 1,
        "name": "Mike Brown",
        "equipment": ["MRI Scanner", "CT Scanner"]
    },
    {
        "id": 2,
        "name": "Lisa Davis",
        "equipment": ["X-Ray Machine", "Ultrasound"]
    }
]

@router.get("/radiologists", response_model=List[Radiologist])
async def get_radiologists():
    """Get all radiologists"""
    return radiologists_db

@router.get("/operators", response_model=List[Operator])
async def get_operators():
    """Get all operators"""
    return operators_db

@router.get("/radiologists/{radiologist_id}", response_model=Radiologist)
async def get_radiologist(radiologist_id: int):
    """Get a specific radiologist by ID"""
    for radiologist in radiologists_db:
        if radiologist["id"] == radiologist_id:
            return radiologist
    raise HTTPException(status_code=404, detail="Radiologist not found")

@router.get("/operators/{operator_id}", response_model=Operator)
async def get_operator(operator_id: int):
    """Get a specific operator by ID"""
    for operator in operators_db:
        if operator["id"] == operator_id:
            return operator
    raise HTTPException(status_code=404, detail="Operator not found") 