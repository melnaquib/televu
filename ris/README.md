# Radiology Information System (RIS)

A web-based Radiology Information System that allows booking exams and assigning radiologists and operators to exams.

## Features

- Book radiology exams with patient information
- View and manage pending exams
- Assign radiologists and operators to exams
- Modern and responsive user interface

## Project Structure

```
ris/
├── be/                 # Backend (FastAPI)
│   ├── app/
│   │   ├── routers/   # API endpoints
│   │   ├── schemas/   # Data models
│   │   └── main.py    # Main application
│   └── requirements.txt
└── fe/                 # Frontend
    ├── static/
    │   ├── css/       # Stylesheets
    │   ├── js/        # JavaScript files
    │   └── img/       # Images
    └── templates/      # HTML templates
```

## Setup

### Backend Setup

1. Create a virtual environment:
   ```bash
   cd ris/be
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Run the backend server:
   ```bash
   uvicorn app.main:app --reload
   ```

The API will be available at `http://localhost:8000`

### Frontend Setup

1. The frontend is static HTML/JS/CSS and can be served using any web server
2. For development, you can use Python's built-in server:
   ```bash
   cd ris/fe
   python -m http.server 8080
   ```

The frontend will be available at `http://localhost:8080`

## API Documentation

Once the backend is running, you can access:
- Interactive API documentation: `http://localhost:8000/docs`
- Alternative API documentation: `http://localhost:8000/redoc`

## Technologies Used

- Backend:
  - FastAPI
  - Pydantic
  - SQLAlchemy (prepared for database integration)

- Frontend:
  - jQuery
  - Bootstrap 5
  - HTML5/CSS3

## Development

- The backend uses in-memory storage for demonstration purposes
- For production use, implement proper database storage
- Add authentication and authorization
- Implement input validation and sanitization
- Add error handling and logging 