FROM python:3.11

# Install Poetry
RUN pip install poetry

# Set the working directory
WORKDIR /application

# Copy pyproject.toml and poetry.lock to the working directory
COPY pyproject.toml poetry.lock ./

# Install dependencies using Poetry
RUN poetry install --no-root

# Copy the rest of the application cosudode into the container
COPY . .

ENV PYTHONPATH=/application

CMD poetry run bash ./prestart.sh; poetry run uvicorn app.main:app --host 0.0.0.0