# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set environment variables to avoid Python writing .pyc files to the container
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Run the application
CMD ["python", "app.py"]
