# Use Python 3.11 as base image
FROM python:3.11-slim

# Install Poetry
RUN sudo apt install python3-poetryFROM python:3.12-slim

# Install poetry
RUN pip install poetry

# Set the working directory
WORKDIR /app

# Copy only the poetry files to install dependencies first (for better caching)
COPY pyproject.toml poetry.lock ./

# Install the dependencies
RUN poetry install --no-root

# Copy the rest of the application files
COPY . .

# Expose the application port
EXPOSE 8000

# Set environment variables
ENV PYTHONPATH=/app

# Run prestart script using poetry
RUN poetry run bash ./prestart.sh

# Start the application using poetry
CMD ["poetry", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]


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
