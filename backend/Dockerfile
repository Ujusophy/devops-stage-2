# Use Python 3.10 as base image
FROM python:3.10-slim

# Install Poetry
RUN pip install poetry

# Set working directory
WORKDIR /app

# Copy poetry files (pyproject.toml and poetry.lock)
COPY pyproject.toml poetry.lock ./

# Install dependencies using Poetry
RUN poetry install --no-root

# Copy the rest of the application code
COPY . .

# Expose port if needed (for FastAPI, typically 8000)
EXPOSE 8000

# Set environment variable if needed
ENV PYTHONPATH=/app

# Run your script or application
CMD ["poetry", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
