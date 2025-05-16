# RIS Backend

The backend service for the Radiology Information System built with FastAPI.

## Setup and Installation

1. Create a Python virtual environment:
```bash
python -m venv venv
```

2. Activate the virtual environment:
```bash
# On Linux/Mac:
source venv/bin/activate

# On Windows:
venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

## Running the Server

Start the development server:
```bash
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

The API will be available at:
- Local: http://localhost:8000
- Network: http://<your-ip>:8000

## API Documentation

Once the server is running, you can access:
- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## API Endpoints

### Exams
- `POST /api/exams/book` - Book a new exam
- `GET /api/exams` - List all exams
- `GET /api/exams/{exam_id}` - Get exam details

### Staff
- `GET /api/modalities/radiologists` - List all radiologists
- `GET /api/modalities/operators` - List all operators
- `GET /api/modalities/radiologists/{id}` - Get radiologist details
- `GET /api/modalities/operators/{id}` - Get operator details

## Development

- The current implementation uses in-memory storage
- For production, implement proper database storage using SQLAlchemy
- Add proper error handling and logging
- Implement authentication and authorization
- Add input validation and sanitization

## Environment Variables

Currently using default settings. For production, configure:
- `DATABASE_URL` - Database connection string
- `API_KEY` - API authentication key
- `DEBUG` - Debug mode flag
- `ALLOWED_ORIGINS` - CORS allowed origins 