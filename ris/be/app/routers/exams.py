from fastapi import APIRouter, HTTPException
from typing import List
from ..schemas.exam import ExamCreate, ExamResponse

router = APIRouter()

# In-memory storage for demo purposes
# In production, use a proper database
exams_db = []

@router.post("/book", response_model=ExamResponse)
async def book_exam(exam: ExamCreate):
    """Book a new exam"""
    new_exam = {
        "id": len(exams_db) + 1,
        **exam.dict()
    }
    exams_db.append(new_exam)
    return new_exam

@router.get("/", response_model=List[ExamResponse])
async def get_exams():
    """Get all exams"""
    return exams_db

@router.get("/{exam_id}", response_model=ExamResponse)
async def get_exam(exam_id: int):
    """Get a specific exam by ID"""
    for exam in exams_db:
        if exam["id"] == exam_id:
            return exam
    raise HTTPException(status_code=404, detail="Exam not found") 