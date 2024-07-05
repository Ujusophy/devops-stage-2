FROM python:3.12-slim
WORKDIR /app
COPY pyproject.toml poetry.lock ./
RUN apt install python3-poetry -y
RUN poetry add uvicorn
RUN poetry shell
RUN poetry run uvicorn app.main:app --reload
COPY . .
EXPOSE 80
CMD ["poetry", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
