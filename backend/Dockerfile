FROM python:3.11-slim
RUN pip install poetry
WORKDIR /app
COPY pyproject.toml poetry.lock ./
RUN poetry install --no-root
COPY . .
ENV PYTHONPATH=/app
RUN poetry run bash ./prestart.sh
