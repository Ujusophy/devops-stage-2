FROM python:3.12-slim
WORKDIR /app
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN pip install poetry
COPY pyproject.toml poetry.lock ./
RUN poetry install
COPY . .
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]

