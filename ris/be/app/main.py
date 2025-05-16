from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="RIS API", description="Radiology Information System API")

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, replace with specific origins
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Import and include routers
from routers import exams, modalities

app.include_router(exams.router, prefix="/api/exams", tags=["exams"])
app.include_router(modalities.router, prefix="/api/modalities", tags=["modalities"])

@app.get("/")
async def root():
    return {"message": "Welcome to RIS API"} 