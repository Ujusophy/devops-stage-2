# Use Python slim image
FROM python:3.12-slim

# Install poetry
RUN pip install poetry

# Set working directory
WORKDIR /app

# Copy dependencies definition files
COPY pyproject.toml poetry.lock ./

# Install dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-root

# Copy the rest of the application
COPY . .

# Expose port
EXPOSE 8000

# Set environment variables
ENV PYTHONPATH=/app

# Run your startup script
RUN poetry run bash ./prestart.sh
v
