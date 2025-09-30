## How to Build and Run Locally

# Build the frontend Docker image with backend URL
docker build --build-arg VITE_BACKEND_URL=http://localhost:5000 -t frontend-image .

# Run container locally
docker run -p 5173:80 frontend-image