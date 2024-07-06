FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN pip install poetry

# Copy and install Python dependencies using Poetry
COPY pyproject.toml poetry.lock ./
RUN poetry config virtualenvs.create false \
    && poetry install --no-root

# Install additional dependencies if needed
RUN pip install sqlalchemy sqlmodel

# Copy the application code
COPY . .

# Expose port 8000 (if needed for your setup)
EXPOSE 8000

# Ensure prestart.sh script is executable
RUN chmod +x ./prestart.sh

# Define the entrypoint command to run prestart.sh and start uvicorn
ENTRYPOINT ["bash", "-c", "./prestart.sh && poetry run uvicorn app.main:app --host 0.0.0.0 --port 80"]
