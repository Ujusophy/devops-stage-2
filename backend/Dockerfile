FROM python:3.12-slim

# Install Poetry
RUN pip install poetry

# Set the working directory
WORKDIR /app

# Copy only the Poetry files to install dependencies first (for better caching)
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
