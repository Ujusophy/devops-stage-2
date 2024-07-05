FROM python:3.12-slim
WORKDIR /app
COPY pyproject.toml poetry.lock ./
RUN apt-get update && apt-get install -y \
    curl \
    && curl -sSL https://install.python-poetry.org | python3.12 -

RUN poetry config virtualenvs.create false \
    && poetry install --no-root --no-dev
COPY . .
EXPOSE 80
CMD ["poetry", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
