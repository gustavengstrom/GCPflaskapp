# Use the official Python image as the base image
FROM python:3.9-slim

# Set environment variables
ENV PORT=8081

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY app .

# Install dependencies
RUN pip install -r requirements.txt

# Mount the service account key file volume (optional for Cloud Run)
# VOLUME ["/secrets"]

# Run the Flask application
CMD ["python", "app.py"]