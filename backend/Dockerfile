# Use Python 3.12 slim base image
FROM python:3.12-slim

# Set working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry via pip
RUN pip install poetry

# Copy only requirements to leverage Docker cache
COPY pyproject.toml poetry.lock ./

# Install project dependencies
RUN poetry install

# Copy the rest of the application code
COPY . .

# Expose port if necessary
# EXPOSE 80

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]

