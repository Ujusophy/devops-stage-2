FROM python:3.10-slim

RUN apt-get update && apt-get install -y curl
WORKDIR /app
RUN curl -sSL https://install.python-poetry.org | python3
ENV PATH="/root/.local/bin:${PATH}"
COPY . ./
RUN poetry install
RUN chmod +x ./prestart.sh
EXPOSE 8000
CMD ["sh", "-c", "./prestart.sh && poetry run uvicorn app.main:app --reload --host 0.0.0.0 --port 8000"]
