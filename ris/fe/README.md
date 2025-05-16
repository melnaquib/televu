# RIS Frontend

The frontend application for the Radiology Information System built with jQuery and Bootstrap.

## Project Structure

```
fe/
├── static/
│   ├── css/
│   │   └── styles.css      # Custom styles
│   ├── js/
│   │   ├── book_exam.js    # Book exam page functionality
│   │   └── modality_assignment.js  # Staff assignment functionality
│   └── img/                # Image assets
└── templates/
    ├── book_exam.html      # Exam booking page
    └── modality_assignment.html  # Staff assignment page
```

## Running the Application

### Option 1: Python HTTP Server (Development)

1. Navigate to the frontend directory:
```bash
cd ris/fe
```

2. Start Python's built-in HTTP server:
```bash
# Python 3.x
python -m http.server 8080

# Python 2.x
python -m SimpleHTTPServer 8080
```

The application will be available at:
- http://localhost:8080/templates/book_exam.html
- http://localhost:8080/templates/modality_assignment.html

### Option 2: Using Nginx (Production)

1. Install Nginx:
```bash
sudo apt-get install nginx  # Ubuntu/Debian
```

2. Configure Nginx:
```nginx
server {
    listen 80;
    server_name localhost;

    root /path/to/ris/fe;
    index templates/book_exam.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

3. Start Nginx:
```bash
sudo service nginx start
```

### Option 3: Using Docker

1. Create a Dockerfile:
```dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html/
```

2. Build and run:
```bash
docker build -t ris-frontend .
docker run -p 8080:80 ris-frontend
```

## Development

### Prerequisites
- Backend API running on http://localhost:8000
- Modern web browser (Chrome, Firefox, Safari, Edge)
- Text editor or IDE

### API Configuration

The frontend is configured to connect to the backend at http://localhost:8000. To change this:

1. Update API URLs in JavaScript files:
   - `static/js/book_exam.js`
   - `static/js/modality_assignment.js`

2. For production, update to your domain:
```javascript
const API_BASE_URL = 'https://your-domain.com/api';
```

### Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

### Dependencies

- jQuery 3.7.1
- Bootstrap 5.3.2
- Custom CSS in styles.css