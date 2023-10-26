# Use an official Python runtime as the base image
FROM python:3.12.0-alpine3.18

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install required packages using pip
RUN pip install --no-cache-dir flask

# Make port 5000 available to the outside world (Flask default port)
EXPOSE 5000

# Run the application when the container launches
CMD ["python", "app_backend.py"]
